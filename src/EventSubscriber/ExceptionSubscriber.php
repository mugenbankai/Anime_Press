<?php

namespace App\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\ExceptionEvent;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Twig\Environment;

class ExceptionSubscriber implements EventSubscriberInterface
{
    public function __construct(
        private Environment $twig,
        private string $environment
    ) {
    }

    public static function getSubscribedEvents(): array
    {
        return [
            KernelEvents::EXCEPTION => 'onKernelException',
        ];
    }

    public function onKernelException(ExceptionEvent $event): void
    {
        $exception = $event->getThrowable();

        // Récupérer le code d'erreur
        $statusCode = $exception instanceof AccessDeniedException || $exception instanceof AccessDeniedHttpException
            ? Response::HTTP_FORBIDDEN
            : ($exception instanceof NotFoundHttpException
                ? Response::HTTP_NOT_FOUND
                : Response::HTTP_INTERNAL_SERVER_ERROR);

        // Déterminer le template à utiliser
        $template = match ($statusCode) {
            403 => 'bundles/TwigBundle/Exception/error403.html.twig',
            404 => 'bundles/TwigBundle/Exception/error404.html.twig',
            500 => 'bundles/TwigBundle/Exception/error500.html.twig',
            default => 'bundles/TwigBundle/Exception/error.html.twig',
        };

        // En mode dev, on ajoute les détails de l'erreur
        $showDetails = $this->environment === 'dev';

        $response = new Response(
            $this->twig->render($template, [
                'status_code' => $statusCode,
                'status_text' => Response::$statusTexts[$statusCode] ?? 'Error',
                'exception' => $exception,
                'show_details' => $showDetails,
            ]),
            $statusCode
        );

        $event->setResponse($response);
    }
}

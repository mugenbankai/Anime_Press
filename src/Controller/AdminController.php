<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/admin')]
#[IsGranted('ROLE_ADMIN')]
class AdminController extends AbstractController
{
    #[Route('/articles', name: 'app_admin_articles')]
    public function articles(ArticleRepository $articleRepository): Response
    {
        $articles = $articleRepository->findBy([], ['created_at' => 'DESC']);

        return $this->render('admin/articles.html.twig', [
            'articles' => $articles,
        ]);
    }

    #[Route('/article/{id}/delete', name: 'app_admin_article_delete', methods: ['POST'])]
    public function deleteArticle(int $id, ArticleRepository $articleRepository, EntityManagerInterface $em): Response
    {
        $article = $articleRepository->find($id);

        if (!$article) {
            throw $this->createNotFoundException('Article non trouvé');
        }

        $em->remove($article);
        $em->flush();

        $this->addFlash('success', 'Article supprimé avec succès');

        return $this->redirectToRoute('app_admin_articles');
    }
}

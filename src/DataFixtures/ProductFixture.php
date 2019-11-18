<?php

namespace App\DataFixtures;

use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class ProductFixture extends Fixture
{
    private $count = 10;

    public function load(ObjectManager $manager)
    {
        for ($x = 1; $x <= $this->count; $x++) {
            $product = new Product();
            $product->setPrice($x * 10)
                ->setTitle('Product for ' . ($x * 10))
                ->setDescription('From fixture');
            $manager->persist($product);
        }

        $manager->flush();
    }
}

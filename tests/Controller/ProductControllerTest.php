<?php

declare(strict_types=1);

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ProductControllerTest extends WebTestCase
{
    /**
     * @test
     */
    public function is_displays_the_product_correctly(): void
    {
        $client = static::createClient();

        $client->request('GET', '/product/1');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals('Check out this great product: "Product for 10" for 10', $client->getResponse()->getContent());
    }

    /**
     * @test
     */
    public function is_creates_and_updates_the_product_correctly(): void
    {
        $client = static::createClient();

        $client->request('GET', '/product');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals('Saved new product with id 11', $client->getResponse()->getContent());

        $client->request('GET', '/product/edit/11');

        $this->assertEquals(302, $client->getResponse()->getStatusCode());

        $client->followRedirect();

        $this->assertEquals(200, $client->getResponse()->getStatusCode());

        $this->assertEquals('Check out this great product: "Keyboard" for 2019', $client->getResponse()->getContent());
    }
}
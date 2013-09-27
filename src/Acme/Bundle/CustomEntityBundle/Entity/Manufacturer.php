<?php

namespace Acme\Bundle\CustomEntityBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * Manufacturer entity
 *
 * @ORM\Entity
 *
 * @ORM\Table(
 *     name="acme_customentity_manufacturer",
 *     uniqueConstraints={@ORM\UniqueConstraint(name="acme_customentity_manufacturer_code_uc", columns={"code"})}
 * )
 * @UniqueEntity(fields="code", message="This manufacturer code is already used.")
 */
class Manufacturer
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string $code
     *
     * @ORM\Column(name="code", type="string", length=100)
     */
    protected $code;

    /**
     * @var string $name
     *
     * @ORM\Column(name="name", type="string", length=100)
     */
    protected $name;
    

    /**
     * @var string $country
     *
     * @ORM\Column(name="country", type="string", length=150)
     */
    protected $country;

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set code
     *
     * @param string $code
     *
     * @return Manufacturer
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Manufacturer
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get country
     *
     * @return string
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Set country
     *
     * @param string $country
     *
     * @return Manufacturer
     */
    public function setCountry($country)
    {
        $this->country = $country;

        return $this;
    }
}

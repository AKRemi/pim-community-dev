<?php
namespace Pim\Bundle\CatalogTaxinomyBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Catalog channel, aims to define scopes
 *
 * @author    Nicolas Dupont <nicolas@akeneo.com>
 * @copyright 2012 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *
 * @ORM\Table(name="Akeneo_PimCatalogTaxinomy_Channel")
 * @ORM\Entity
 */
class Channel
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
     * @var string $localeCode
     * @ORM\Column(name="code", type="string", length=255, unique=true)
     */
    protected $code;

    /**
     * @var $locales
     *
     * @ORM\OneToMany(targetEntity="ChannelLocale", mappedBy="channel", cascade={"persist", "remove"})
     */
    protected $locales;

    /**
     * @ORM\Column(name="is_default", type="boolean")
     */
    protected $isDefault;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->locales = new \Doctrine\Common\Collections\ArrayCollection();
    }

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
     * Set id
     * @param integer $id
     * 
     * @return Channel
     */
    public function setId($id)
    {
        return $this->id = $id;

        return $this;
    }

    /**
     * Set code
     *
     * @param string $code
     * 
     * @return Channel
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
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
     * Set as default channel
     *
     * @param boolean $default
     * 
     * @return Channel
     */
    public function setIsDefault($default)
    {
        $this->isDefault = $default;

        return $this;
    }

    /**
     * Get is default
     *
     * @return boolean
     */
    public function getIsDefault()
    {
        return $this->isDefault;
    }

    /**
     * Add locales
     *
     * @param Pim\Bundle\CatalogTaxinomyBundle\Entity\ChannelLocale $locale
     * 
     * @return Channel
     */
    public function addLocale(\Pim\Bundle\CatalogTaxinomyBundle\Entity\ChannelLocale $locale)
    {
        $locale->setChannel($this);
        $this->locales[] = $locale;

        return $this;
    }

    /**
     * Remove locales
     *
     * @param Pim\Bundle\CatalogTaxinomyBundle\Entity\ChannelLocale $locale
     */
    public function removeLocale(\Pim\Bundle\CatalogTaxinomyBundle\Entity\ChannelLocale $locale)
    {
        $this->locales->removeElement($locale);
    }

    /**
     * Get locales
     *
     * @return Doctrine\Common\Collections\Collection
     */
    public function getLocales()
    {
        return $this->locales;
    }
}
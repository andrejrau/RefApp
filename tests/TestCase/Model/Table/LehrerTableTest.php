<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\LehrerTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\LehrerTable Test Case
 */
class LehrerTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\LehrerTable
     */
    public $Lehrer;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.lehrer',
        'app.arbeitsmaterialien',
        'app.klasse_fach'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('Lehrer') ? [] : ['className' => LehrerTable::class];
        $this->Lehrer = TableRegistry::get('Lehrer', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->Lehrer);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     */
    public function testBuildRules()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}

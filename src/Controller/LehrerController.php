<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Lehrer Controller
 *
 * @property \App\Model\Table\LehrerTable $Lehrer
 *
 * @method \App\Model\Entity\Lehrer[] paginate($object = null, array $settings = [])
 */
class LehrerController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Http\Response|void
     */
    public function index()
    {
        $lehrer = $this->paginate($this->Lehrer);

        $this->set(compact('lehrer'));
        $this->set('_serialize', ['lehrer']);
    }

    /**
     * View method
     *
     * @param string|null $id Lehrer id.
     * @return \Cake\Http\Response|void
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $lehrer = $this->Lehrer->get($id, [
            'contain' => ['Arbeitsmaterialien', 'KlasseFach']
        ]);

        $this->set('lehrer', $lehrer);
        $this->set('_serialize', ['lehrer']);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $lehrer = $this->Lehrer->newEntity();
        if ($this->request->is('post')) {
            $lehrer = $this->Lehrer->patchEntity($lehrer, $this->request->getData());
            if ($this->Lehrer->save($lehrer)) {
                $this->Flash->success(__('The lehrer has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The lehrer could not be saved. Please, try again.'));
        }
        $this->set(compact('lehrer'));
        $this->set('_serialize', ['lehrer']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Lehrer id.
     * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $lehrer = $this->Lehrer->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $lehrer = $this->Lehrer->patchEntity($lehrer, $this->request->getData());
            if ($this->Lehrer->save($lehrer)) {
                $this->Flash->success(__('The lehrer has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The lehrer could not be saved. Please, try again.'));
        }
        $this->set(compact('lehrer'));
        $this->set('_serialize', ['lehrer']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Lehrer id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $lehrer = $this->Lehrer->get($id);
        if ($this->Lehrer->delete($lehrer)) {
            $this->Flash->success(__('The lehrer has been deleted.'));
        } else {
            $this->Flash->error(__('The lehrer could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}

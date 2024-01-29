import Component from '@glimmer/component'
import { on } from '@ember/modifier'
import { service } from '@ember/service'
import { tracked } from '@glimmer/tracking'

export default class TodoItem extends Component {
  <template>
    <li class="{{if @todo.completed 'completed'}} {{if this.editing 'editing'}}">
      <div class="view">
        <input 
          class="toggle"
          type="checkbox"
          aria-label="Toggle the completion state of this todo"
          checked={{@todo.completed}}
          {{on 'change' this.toggleCompleted}}
        />
        <label {{on 'dblclick' this.startEditing}}>{{@todo.title}}</label>
        <button
          class="destroy"
          type="button"
          aria-label="Delete this todo"
          {{on 'click' this.removeTodo}}
        />
      </div>

      <input
        class="edit"
        value={{@todo.title}}
        autofocus
        {{on 'blur' this.doneEditing}}
        {{on 'keydown' this.handleKeydown}}
      />
    </li>

  </template>

  @service repo
  @tracked editing
  
  removeTodo = () => this.repo.delete(this.args.todo);

  toggleCompleted = (event) => {
      this.args.todo.completed = event.target.checked;
			this.repo.persist();
  }
  

  startEditing = (event) => {
    this.args.onStartEdit()
    this.editing = true

    event.target.closest('li')?.querySelector('input.edit').focus()
  }

  doneEditing = (event) => {
    if (!this.editing) { return; }

    let todoTitle = event.target.value.trim()

    if (isBlank(todoTitle)) {
      this.removeTodo()

    } else {
      this.args.todo.title = todoTitle
      this.editing = false
      this.args.onEndEdit()
    }
  }

  handleKeydown = (event) => {
    if (event.KeyCode === 13) {
      event.target.blur()
    } else if (event.keyCode === 27) {
      this.editing = false
    }
  }
}

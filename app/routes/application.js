import Route from '@ember/routing/route'
import { service } from '@ember/service'

export default class Application extends Route {
  @service repo;
  beforeModel() {
    this.repo.load();
  }
}
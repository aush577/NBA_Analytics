import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {
  constructor(private http: HttpClient) { }

  private async request(method: string, url: string, data?: any) {
    const result = this.http.request(method, url, {
      body: data,
      responseType: 'json',
      observe: 'body',
    });
    return new Promise((resolve, reject) => {
      result.subscribe(resolve, reject);
    });
  }

  getPlayer() {
    return this.request('GET', `${environment.serverUrl}/player/get`);
  }

  createPlayer(player) {
    // console.log("create player: " + player);
    return this.request('POST', `${environment.serverUrl}/player/create`, player);
  }

  updatePlayer(player) {
    // console.log("update player: " + player);
    return this.request('PUT', `${environment.serverUrl}/player/edit/${player.ID}`, player);
  }

  deletePlayer(player) {
    // console.log("delete player: " + player);
    return this.request('DELETE', `${environment.serverUrl}/player/edit/${player.ID}`, player);
  }

  getPlayerStats(playerID) {
    return this.request('GET', `${environment.serverUrl}/player/view/${playerID.ID}`, playerID)
  }

  favoritePlayer(player) {
    return this.request('POST', `${environment.serverUrl}/player/get`, player)
  }
  
  unfavoritePlayer(player) {
    return this.request('DELETE', `${environment.serverUrl}/player/get`, player)
  }

  getFavorites() {
    return this.request('GET', `${environment.serverUrl}/favorites`);
  }

  setPercents(paramDict) {
    return this.request('PUT', `${environment.serverUrl}/favorites`, paramDict);
  }

  playerExists(player) {
    return this.request('GET', `${environment.serverUrl}/player/edit/${player.ID}`, player);
  }

  getTeam() {
    return this.request('GET', `${environment.serverUrl}/teams`);
  }

  getTeamView(teamCity) {
    return this.request('GET', `${environment.serverUrl}/teams/view/${teamCity.City}`, teamCity);
  }

  getInjuries() {
    return this.request('GET', `${environment.serverUrl}/injuries`);
  }

  getNextID() {
    return this.request('GET', `${environment.serverUrl}/player/create`);
  }
  
}
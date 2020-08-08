import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AddPlayerComponent } from './add-player/add-player.component';
import { EditPlayerComponent } from './edit-player/edit-player.component';
import { GetPlayerComponent } from './get-player/get-player.component';
import { ViewPlayerComponent } from './view-player/view-player.component';
import { MyFavoritesComponent } from './my-favorites/my-favorites.component';
import { TeamsComponent } from './teams/teams.component';
import { ViewTeamsComponent } from './view-teams/view-teams.component';
import { InjuriesComponent } from './injuries/injuries.component';
import { HomeComponent } from './home/home.component';


const routes: Routes = [
  {
    path: 'player/create',
    component: AddPlayerComponent
  },
  {
    path: 'player/edit/:ID',
    component: EditPlayerComponent
  },
  {
    path: 'player/get',
    component: GetPlayerComponent
  },
  {
    path: 'player/view/:ID',
    component: ViewPlayerComponent
  },
  {
    path: 'favorites',
    component: MyFavoritesComponent
  },
  {
    path: 'teams',
    component: TeamsComponent
  },
  {
    path: 'teams/view/:City',
    component: ViewTeamsComponent
  },
  {
    path: 'injuries',
    component: InjuriesComponent
  },
  {
    path: '',
    component: HomeComponent
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
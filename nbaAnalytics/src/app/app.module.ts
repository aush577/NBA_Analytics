import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AddPlayerComponent } from './add-player/add-player.component';
import { EditPlayerComponent } from './edit-player/edit-player.component';
import { GetPlayerComponent } from './get-player/get-player.component';
import { SlimLoadingBarModule } from 'ng2-slim-loading-bar';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatSortModule} from '@angular/material/sort';
import { ViewPlayerComponent } from './view-player/view-player.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { MyFavoritesComponent } from './my-favorites/my-favorites.component';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { FormsModule } from '@angular/forms';
import {MatSliderModule} from '@angular/material/slider';
import {MatButtonModule} from '@angular/material/button';
import { ChartsModule } from 'ng2-charts';
import {MatDialogModule} from '@angular/material/dialog';
import {MatFormFieldModule} from '@angular/material/form-field';
import { TeamsComponent } from './teams/teams.component';
import { ViewTeamsComponent } from './view-teams/view-teams.component';
import { InjuriesComponent } from './injuries/injuries.component';
import {MatInputModule} from '@angular/material/input';
import { HomeComponent } from './home/home.component';



@NgModule({
  declarations: [
    AppComponent,
    AddPlayerComponent,
    EditPlayerComponent,
    GetPlayerComponent,
    ViewPlayerComponent,
    MyFavoritesComponent,
    TeamsComponent,
    ViewTeamsComponent,
    InjuriesComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    SlimLoadingBarModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    FontAwesomeModule,
    MatCheckboxModule,
    MatSliderModule,
    MatButtonModule,
    ChartsModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule
  ],
  exports: [
    MatPaginatorModule,
    MatSortModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup,  FormBuilder,  Validators } from '@angular/forms';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { faEye } from '@fortawesome/free-solid-svg-icons';
import { faPencilAlt } from '@fortawesome/free-solid-svg-icons';
import { SelectionModel } from '@angular/cdk/collections';
import {MatSort} from '@angular/material/sort';
import {MatInputModule} from '@angular/material/input';

@Component({
  selector: 'app-get-player',
  templateUrl: './get-player.component.html',
  styleUrls: ['./get-player.component.css']
})
export class GetPlayerComponent implements OnInit {
  faEye = faEye;
  faPencilAlt = faPencilAlt;
  displayedColumns: string[] = ['Select', 'ID', 'Name', 'Weight', 'Height', 'College', 'Nationality', 'Experience', 'View', 'Edit'];
  players: MatTableDataSource<any>;
  array = [];
  @ViewChild(MatSort, {static: true}) sort: MatSort;
  selection = new SelectionModel<[]>(true, []);

  favoritedPlayers = [];   // for restoring checkboxes

  @ViewChild(MatPaginator) paginator: MatPaginator;
  constructor(private p: PlayerService) {
  }

  ngOnInit() {
    this.getPlayer();
    // console.log("Favorites: " + this.favoritedPlayers);
  }

  getPlayer(){
    this.p.getPlayer().then((response: any) => {
      this.array = response.map((pl) => {
        //console.log(pl);
        return pl;
      });
      // console.log(this.array[0])
      this.players = new MatTableDataSource(this.array[2]);
      this.players.paginator = this.paginator;
      this.players.sort = this.sort;
      
      // Restore checkboxes
      this.favoritedPlayers = this.array[1]
      for (var i=0; i<this.favoritedPlayers.length; i++) {
        for (var j=0; j<this.array[2].length; j++) {
          if (this.favoritedPlayers[i]['ID'] == this.array[2][j]['ID']){
            this.selection.toggle(this.array[2][j]);
            break;  // Runtime optimization
            // console.log("IF STATEMENT LOOK AT ME" + this.array[0][j]);
          }
        }
      }      
    });
  }
  
  playerSelected(player){
    let playerChecked:boolean = !this.selection.isSelected(player);

    if (playerChecked) {
      // console.log("favorite player: " + player.ID);
      this.p.favoritePlayer(player);      
    } else {
      // console.log("unfavorite player: " + player.ID);
      this.p.unfavoritePlayer(player);
    } 
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.players.filter = filterValue.trim().toLowerCase();
  }
}

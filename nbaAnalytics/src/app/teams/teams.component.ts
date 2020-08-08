import { Component, OnInit,ViewChild } from '@angular/core';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { faEye } from '@fortawesome/free-solid-svg-icons';
import { faPencilAlt } from '@fortawesome/free-solid-svg-icons';
import { SelectionModel } from '@angular/cdk/collections';
import {MatSort} from '@angular/material/sort';

@Component({
  selector: 'app-teams',
  templateUrl: './teams.component.html',
  styleUrls: ['./teams.component.css']
})
export class TeamsComponent implements OnInit {
  faEye = faEye;
  faPencilAlt = faPencilAlt;
  displayedColumns: string[] = ['Logo', 'Team City', 'Team Name', 'Defensive Rating', 'Offensive Rating', 'Conference', 'Wins', 'Losses', 'View Roster'];
  teams: MatTableDataSource<any>;
  // team_global = [];
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(private p: PlayerService) {
  }

  ngOnInit() {
    this.getTeam();
  }

  getTeam(){
    this.p.getTeam().then((response: any) => {
      let teams = response.map((team) => {
        return team;
      });
      this.teams = new MatTableDataSource(teams);
      this.teams.paginator = this.paginator; 
      // this.teams.sort = this.sort; 
      // this.team_global = teams;
      // console.log(this.team_global);
    });

    // var str = this.team_global['Team_City'];
    // console.log(str);
    
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.teams.filter = filterValue.trim().toLowerCase();
  }
}
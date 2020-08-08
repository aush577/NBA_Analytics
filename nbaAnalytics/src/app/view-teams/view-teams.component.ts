import { Component, OnInit, ViewChild } from '@angular/core';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { ActivatedRoute } from '@angular/router';
import { faEye } from '@fortawesome/free-solid-svg-icons';
@Component({
  selector: 'app-view-teams',
  templateUrl: './view-teams.component.html',
  styleUrls: ['./view-teams.component.css']
})
export class ViewTeamsComponent implements OnInit {
  faEye = faEye;
  teamRoster: MatTableDataSource<any>;
  displayedColumns: string[] = ['ID', 'Name', 'View'];
  array = [];

  @ViewChild(MatPaginator) paginator: MatPaginator;
  constructor(private ar: ActivatedRoute, private p: PlayerService) { }

  ngOnInit(){
    this.getTeamView();
  }

  getTeamView() {
    const teamCity = {
      City: this.ar.snapshot.paramMap.get("City")
    }
    this.p.getTeamView(teamCity).then((response: any) => {
      let arr = response.map((Team) => {
        return Team;
      });
      this.array = arr[0];
      // console.log(this.array);
      // console.log(this.array['Team_Name']);
      this.teamRoster = new MatTableDataSource(arr);
      this.teamRoster.paginator = this.paginator;
    });
  }

}

import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { faEye } from '@fortawesome/free-solid-svg-icons';
import { SelectionModel } from '@angular/cdk/collections';
import { faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { ChartDataSets, ChartOptions } from 'chart.js';
import { Color, Label, MultiDataSet, Colors, SingleDataSet } from 'ng2-charts';

@Component({
  selector: 'app-my-favorites',
  templateUrl: './my-favorites.component.html',
  styleUrls: ['./my-favorites.component.css']
})

export class MyFavoritesComponent implements OnInit {
  atLeastOneSelected = false;
  submitted = false;

  faTrashAlt = faTrashAlt;
  faEye = faEye;

  displayedColumnsFav: string[] = ['ID', 'Name', 'View', 'Unfavorite'];
  displayedColumnsRec: string[] = ['Select','ID', 'Name', 'View'];

  favorites: MatTableDataSource<any>;
  recommended: MatTableDataSource<any>;
  
  @ViewChild(MatPaginator) paginator: MatPaginator;

  paramColumns = [];
  paramDict = {};
  restorePercents = [];
  selection = new SelectionModel<[]>(true, []);

  //weight, height, experience, PPG, RPG, APG, BPG, FT, FG, TPT
  Data: Array<any> = [
    { name: 'Weight', id: 'weight'},
    { name: 'Height', id: 'height'},
    { name: 'Experience', id: 'experience'},
    { name: 'Points Per Game', id: 'ppg'},
    { name: 'Rebounds Per Game', id: 'rpg'},
    { name: 'Assists Per Game', id: 'apg'},
    { name: 'Blocks Per Game', id: 'bpg'},
    { name: 'Free Throw Percentage', id: 'ft'},
    { name: 'Field Goal Percentage', id: 'fg'},
    { name: 'Three Point Percentage', id: 'tpt'}
  ];

  constructor(private p: PlayerService) {
    /* create booleans and dict based on columns we decide to display
       mOdUlAr, all we gotta do is change columns in Data
    */
    this.Data.forEach(column => {
      this.paramColumns.push(column.id);
      this.doughnutChartLabels.push(column.name);
    });

    this.paramColumns.forEach(column => {
      this.paramDict[column] = 0;
    });
  }

  ngOnInit() {
    this.getFavorites();
  }

  formatLabel(value: number) {
    return value;
  }

  getSliderVal(data) {
    return this.paramDict[data.id];
  }

  updateSliderVals(newVals) {
    var keyArr = Object.keys(newVals).slice(1);

    keyArr.forEach(element => {
      this.paramDict[element.toLowerCase()] = newVals[element];
    });
  }

  getFavorites() {
    this.p.getFavorites().then((response: any) => {
      let array = response.map((fav) => {
        return fav;
      });

      this.updateSliderVals(array[2][0]);
      this.validate();
  
      this.favorites = new MatTableDataSource(array[0]);
      this.recommended = new MatTableDataSource(array[1]);
      this.favorites.paginator = this.paginator;
    });
  }

  onSliderChange(e, data) {
    this.paramDict[data.id] = e.value;
    this.validate();
  }
  
  resetSliders(){
    Object.keys(this.paramDict).forEach(element => {
      this.paramDict[element] = 0;
    });
    this.validate();
  }

  validate() {
    //console.log(Object.values(this.paramDict));
    var sum = 0;
    Object.values(this.paramDict).forEach(element => {
      var elemInt = Number(element);
      sum += elemInt;
    });
    
    this.atLeastOneSelected = (sum != 0);
    this.renderDonutChart();
  }

  submitForm() {
    this.p.setPercents(this.paramDict);
    this.reloadPage();
  }

  playerSelected(player){
    let playerChecked:boolean = !this.selection.isSelected(player);

    if (playerChecked) {
      this.p.favoritePlayer(player);      
    } else {
      this.p.unfavoritePlayer(player);
    }
  }

  reloadPage() {
    window.location.reload();
  }

  trashPlayer(favorite) {
    this.p.unfavoritePlayer(favorite);
    this.reloadPage();
  }

  doughnutChartLabels = [];
  doughnutChartData = [];
  doughnutChartColors = [];
  doughnutChartType = 'doughnut';
  doughnutChartOptions = {};
  render = false;

  renderDonutChart() {
    this.doughnutChartOptions = {
      responsive: true,
      title: {
        text: 'Weight Breakdown',
        display: true,
        fontSize: 16
      },
      legend: {
        position: 'right',
        align: 'center',
        labels: {
          fontSize: 12,
          usePointStyle: true
        }
      }
    } as ChartOptions;

    this.doughnutChartColors = [
      {
        backgroundColor: ["#e84351", "#434a54", "#3ebf9b", "#4d86dc", "#f3af37", "#ff6700", "#32b9d8", "#c0c0c0", "#3a6ea5", "#588b8b"]
      }
    ] as Colors[];

    this.doughnutChartData = Object.values(this.paramDict) as SingleDataSet;
    this.render = true;
  }
}
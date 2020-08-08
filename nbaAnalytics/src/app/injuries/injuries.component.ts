import { Component, OnInit, ViewChild } from '@angular/core';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { ChartOptions, ChartType, ChartDataSets, RadialChartOptions } from 'chart.js';
import { Label, MultiDataSet, Colors } from 'ng2-charts';
import { faEye } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-injuries',
  templateUrl: './injuries.component.html',
  styleUrls: ['./injuries.component.css']
})
export class InjuriesComponent implements OnInit {
  faEye = faEye;
  displayedColumns: string[] = ['ID', 'Name', 'Date', 'Type', 'Status', 'View'];
  injuries: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  type = [];

  injuryTypeCounts = [];
  counts = [];
  lab = [];

  array = [];
  
  injuryStatusCounts = [];
  countStatus = [];
  labStatus = [];

  constructor(private p: PlayerService) { }

  ngOnInit(){
    this.getInjuries();
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.injuries.filter = filterValue.trim().toLowerCase();
  }

  getInjuries() {
    this.p.getInjuries().then((response: any) => {
      this.array = response.map((inj) => {
        return inj;
      });
      
      this.injuryTypeCounts = this.array[1];
      for (var i = 0; i < this.injuryTypeCounts.length; i++) {
        this.counts.push(this.injuryTypeCounts[i]['COUNT(Type)']);
        this.lab.push(this.injuryTypeCounts[i]['Type']);
      }

      this.injuryStatusCounts = this.array[2];
      // console.log(this.injuryStatusCounts);
      for (var i = 0; i < this.injuryStatusCounts.length; i++) {
        this.countStatus.push(this.injuryStatusCounts[i]['COUNT(Status)']);
        this.labStatus.push(this.injuryStatusCounts[i]['Status']);
      }

      //console.log(this.counts);
      this.barChartLabels = this.lab as Label[];
      this.barChartData = [{data: this.counts, label: "Number of Injuries"}] as ChartDataSets[];
      
      // console.log(this.labStatus);
      // console.log(this.countStatus);
      this.doughnutChartLabels = this.labStatus as Label[];
      this.doughnutChartData = [this.countStatus] as MultiDataSet[];
      this.doughnutChartColors = [
        {
          backgroundColor: ['#ffff9e', '#fac591', '#ff9d9c']
        }] as Colors[];

      this.injuries = new MatTableDataSource(this.array[0]);
      this.injuries.paginator = this.paginator;  
      
      this.barChartOptions = {
          responsive: true,
          title: {
            text: 'Injury Count Breakdown',
            display: true
          }
        } as ChartOptions;

      this.doughnutChartOptions = {
        responsive: true,
        title: {
          text: 'Injury Type Breakdown',
          display: true
        }
      } as ChartOptions;

      this.render = true;
    });
    
  }

  barChartOptions = {};
  barChartLabels = [];
  barChartData = [];
  barChartType = 'bar';
  barChartLegend = true;
  barChartPlugins = [];

  doughnutChartLabels = [];
  doughnutChartData = [];
  doughnutChartType = 'doughnut';
  doughnutChartColors = [];
  doughnutChartOptions = {};
  render = false;  
 }

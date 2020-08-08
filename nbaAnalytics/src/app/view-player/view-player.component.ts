import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlayerService } from '../player.service';
import {MatTableDataSource} from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { faPencilAlt } from '@fortawesome/free-solid-svg-icons';
import { ChartOptions, ChartType, ChartDataSets, RadialChartOptions } from 'chart.js';
import { Label, Colors } from 'ng2-charts';
import { environment } from 'src/environments/environment';


@Component({
  selector: 'app-view-player',
  templateUrl: './view-player.component.html',
  styleUrls: ['./view-player.component.css']
})
export class ViewPlayerComponent implements OnInit {
  faPencilAlt = faPencilAlt;
  displayedColumns: string[] = ['ID', 'PPG', 'RPG', 'APG', 'BPG', 'FT', 'FG', '3PT'];
  playerStats: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  player_stats = [];
  player = [];
  injuries = [];
  plays_for = [];
  fav_avg_stats = [];
  nba_avg_stats = [];
  team_avg_stats = [];
  favorites = [];
  bubble_chart_data = [];
  playerNetID = "";
  rookie = "";
  player_labels = [];
  fav_players_data = [];
  
  constructor(private ar: ActivatedRoute, private p: PlayerService) { }

  ngOnInit() {
    this.getPlayerStats()
  }

  getPlayerStats() {
    const playerID = {
      ID: this.ar.snapshot.paramMap.get("ID")
    }

    this.p.getPlayerStats(playerID).then((response: any) => {
      let arr = response.map((pStats) => {
        //console.log(pStats);
        return pStats;
      });
      
      /* 
        0th array is player_stats
        1st array is player info (player table)
        2nd array is injuries
        3rd array is plays_for
        4th array is favorite avg stats
        5th array is NBA avg stats
      */
      this.player_stats = arr[0];
      this.player = arr[1][0];
      this.injuries = arr[2][0];
      this.plays_for = arr[3][0];
      this.fav_avg_stats = arr[4][0];
      this.nba_avg_stats = arr[5][0];
      this.team_avg_stats = arr[6][0];
      this.favorites = arr[7][0];
      this.bubble_chart_data = arr[8];
      this.fav_players_data = arr[9];
      //console.log(this.bubble_chart_data);
      
      this.playerStats = new MatTableDataSource(this.player_stats);
      this.playerStats.paginator = this.paginator;

      this.rookie = this.player['Experience'] + " year(s)";
      if (this.player['Experience'] == 0) {
        this.rookie = "Rookie";
      }

     
      // console.log(this.bubbleChartData);

      // console.log(this.bubble_chart_data);
      if (this.player_stats[0] != undefined) {
        this.renderBarChart();
        
        this.teammate_data.push({x: 0, y:0, r: 0});  //For indexing off by 1
        this.player_labels[0] = "";
        this.bubble_chart_data.forEach(player => {
          // console.log("curr ID" + this.player['ID']);
          // console.log("iterator" + player.ID);
          //FG(x), TPT(Y), Experience(R)
          if (player.ID != this.player['ID']) {
            this.teammate_data.push({x: player.FG, y: player.TPT, r: player.PPG, id: player.ID});
            this.player_labels[player.ID] = player.Name;
          } else {  // Dont include self
            this.teammate_data.push({x: 0, y:0, r: 0, id: player.ID});
            this.player_labels[player.ID] = player.Name;
          }
        });

        this.fav_players_data.forEach(player => {
          // console.log("curr ID" + this.player['ID']);
          // console.log("iterator" + player.ID);
          //FG(x), TPT(Y), Experience(R)
          if (player.ID != this.player['ID']) {
            this.fav_data.push({x: player.FG, y: player.TPT, r: player.PPG, id: player.ID});
            this.player_labels[player.ID] = player.Name;
          } else {  // Dont include self
            this.fav_data.push({x: 0, y:0, r: 0, id: player.ID});
            this.player_labels[player.ID] = player.Name;
          }
        });

        // console.log(this.fav_data);
        // console.log(this.teammate_data);

        this.fav_data.forEach((player) => {
          //console.log(player);
          this.teammate_data.forEach((teammate, i) => {
            //console.log(bubble_player);
            if (player.id == teammate.id) {
              //console.log("removing id: " + player.id);
              this.teammate_data.splice(i, 1);
            }
          });
        });

        // console.log(this.fav_data);
        // console.log(this.teammate_data);

        this.renderBubbleChart();
        this.render = true;
      }
      
      // Get player Net ID
      var str = (this.player['Name']).toLowerCase();
      var nameArr = str.split(" ");
      if (nameArr.length >= 2) {
        var fiveLast = nameArr[1].substring(0,5);
        var firstTwo = nameArr[0].substring(0,2);
        this.playerNetID = fiveLast+firstTwo;
      }

    });
  }

  addFavorite() {
    const playerID = {
      ID: this.ar.snapshot.paramMap.get("ID")
    }
    this.p.favoritePlayer(playerID);
    this.reloadPage();
  }
  removeFavorite() {
    const playerID = {
      ID: this.ar.snapshot.paramMap.get("ID")
    }
    this.p.unfavoritePlayer(playerID);
    this.reloadPage();
  }


  barChartOptions = {};
  barChartLabels = [];
  barChartData = [];
  barChartType = 'bar';
  barChartColors = [
    { backgroundColor: 'rgba(051, 153, 255, 0.8)' }, //blue
    { backgroundColor: 'rgba(253, 100, 100, 0.8)' },  //red
    { backgroundColor: 'rgba(255, 153, 102, 0.8)' },  //orange
    { backgroundColor: 'rgba(153, 255, 153, 0.8)' },  //green
  ];

  barChartPlugins = [];
  barChartLegend = true;
  render = false;

  renderBarChart() {
    this.barChartOptions = {
      responsive: true,
      title: {
        text: this.player['Name'] + "'s Stats Breakdown" ,
        display: true,
        fontSize: 16
      },
    } as ChartOptions;
    //console.log(this.player_stats[0]);

    var labels = Object.keys(this.player_stats[0]).slice(1);
    // console.log(labels);

    var player_vals = Object.values(this.player_stats[0]).slice(1);
    // console.log(player_vals);

    var fav_avg_vals = Object.values(this.fav_avg_stats);
    var nba_avg_vals = Object.values(this.nba_avg_stats);
    var team_avg_vals = Object.values(this.team_avg_stats);
    
    this.barChartLabels = labels as Label[];
    
    this.barChartData = [
      { data: player_vals, label: this.player['Name'] + "'s Stats" },
      { data: fav_avg_vals, label: 'Favorites Average' },
      { data: nba_avg_vals, label: 'NBA Average' },
      { data: team_avg_vals, label: 'Team Average', color: 'green'}
    ]  as ChartDataSets[];
  }


  bubbleChartData = [];
  bubbleChartOptions = {};
  bubbleChartLegend = true;
  bubbleChartType = 'bubble';
  bubbleChartColors = [];
  teammate_data = [];
  fav_data = [];

  renderBubbleChart() {
    //FG(x), TPT(Y), PPG(R)
    //console.log(this.fav_players_data);
    this.bubbleChartOptions = {
      responsive: true,
      title: {
        text: 'FG% vs TPT% vs PPG for Teammates and Favorited Players',
        display: true,
        fontSize: 16,
      },
      scales: {
        xAxes: [{ 
          scaleLabel: {
            display: true,
            labelString: 'Field Goal Percentage'
          },
          ticks: {
            min: 0.2,
            max: 0.8,
          }
        }],
        yAxes: [{
          scaleLabel: {
            display: true,
            labelString: 'Three Point Percentage'
          },
          ticks: {
            min: 0,
            max: 0.7,
          }
        }]
      },
      tooltips: {
        callbacks: {
            label: function(tooltipItem, data) {
              // console.log("data: " + data);
              // console.log("dataset index: " + tooltipItem.datasetIndex)
              //console.log(data.datasets[1].labels);
              if (tooltipItem.datasetIndex != 0) {
                var playerID = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].id;
                //console.log(playerID);
                var label = [data.datasets[tooltipItem.datasetIndex].labels[playerID]];
                // console.log("ttItem index + 1: " + (tooltipItem.index + 1));
                // console.log(data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index + 1]);
                // console.log("xLabel: " + tooltipItem.xLabel);
                // console.log("yLabel: " + tooltipItem.yLabel);

                var fgPercent = "FG: " + (tooltipItem.xLabel * 100).toFixed(2) + "%";
                var tptPercent = "TPT: " + (tooltipItem.yLabel * 100).toFixed(2) + "%";
                var ppg = "PPG: " + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].r;

                label.push(fgPercent);
                label.push(tptPercent);
                label.push(ppg);

                return label;
              }
              
              return data.datasets[0].label;
            }
        }
    }
    };

    this.bubbleChartColors = [
      { backgroundColor: 'rgba(253, 100, 100, 0.6)' },  //red
      { backgroundColor: 'rgba(153, 255, 153, 0.8)' },  //green  
      { backgroundColor: 'rgba(051, 153, 255, 0.8)' },  //blue
    ] as Colors[];
    
    // console.log(this.bubbleChartData[this.player['ID']]);
    // console.log(this.player_stats[0]);
    
    let playerData = [
      {
      x: this.player_stats[0]['FG'], 
      y: this.player_stats[0]['TPT'], 
      r: this.player_stats[0]['PPG'],
      }
    ];

    // console.log(this.bubbleChartData);
    // console.log(this.player_labels);
    this.bubbleChartData = [
      {data: playerData, label: this.player['Name']},
      {data: this.teammate_data, labels: this.player_labels, label: "Teammates"},
      {data: this.fav_data, labels: this.player_labels, label: "Favorites"}
    ] as ChartDataSets[];

    // console.log(this.bubbleChartData);
  }

  reloadPage() {
    window.location.reload();
  }

  bubbleChartClicked(event) {
    var activePoint = event.active[0];
    if (activePoint != undefined && activePoint._datasetIndex != 0) {
      // console.log(event);
      // console.log(event.active);
      // console.log(event.active[0]);
      // console.log(event.active[0]._chart.data);
      var data = activePoint._chart.data;
      var playerID = data.datasets[activePoint._datasetIndex].data[activePoint._index].id;
      // console.log("Changing to player ID: " + playerID);
      window.location.href = window.location.origin + "/player/view/" + playerID;
    }
  }
}

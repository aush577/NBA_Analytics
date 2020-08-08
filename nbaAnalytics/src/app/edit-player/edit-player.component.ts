import { Component, OnInit, NgModule } from '@angular/core';
import { FormGroup,  FormBuilder,  Validators } from '@angular/forms';
import { PlayerService } from '../player.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-player',
  templateUrl: './edit-player.component.html',
  styleUrls: ['./edit-player.component.css']
})
export class EditPlayerComponent implements OnInit {

  constructor(private fb: FormBuilder, private p: PlayerService, private ar: ActivatedRoute) {
    this.createForm();
  }
  angForm: FormGroup;

  array = [];
  //currentPlayer: any = {ID: null, Name: '', Weight: null , Height: null, College: '', Nationality: '', Experience: null};

  createForm() {
    this.angForm = this.fb.group({
      ID: [history.state.player.ID],
      Name: [history.state.player.Name, Validators.required],
      Weight: [history.state.player.Weight, Validators.required],
      Height: [history.state.player.Height, Validators.required],
      College: [history.state.player.College],
      Nationality: [history.state.player.Nationality],
      Experience: [history.state.player.Experience, Validators.required],
      PPG: [history.state.player.PPG, Validators.required],
      RPG: [history.state.player.RPG, Validators.required],
      APG: [history.state.player.APG, Validators.required],
      BPG: [history.state.player.BPG, Validators.required],
      FT: [history.state.player.FT, Validators.required],
      FG: [history.state.player.FG, Validators.required],
      TPT: [history.state.player.TPT, Validators.required]
    });
    this.angForm.get('ID').disable();
  }

  updatePlayer() {
    const player_data = {
      Name: this.angForm.get('Name').value,
      Weight: this.angForm.get('Weight').value,
      Height: this.angForm.get('Height').value,
      College: this.angForm.get('College').value, 
      Nationality: this.angForm.get('Nationality').value, 
      Experience: this.angForm.get('Experience').value,
      PPG: this.angForm.get('PPG').value,
      RPG: this.angForm.get('RPG').value,
      APG: this.angForm.get('APG').value,
      BPG: this.angForm.get('BPG').value,
      FT: this.angForm.get('FT').value,
      FG: this.angForm.get('FG').value,
      TPT: this.angForm.get('TPT').value,
      ID: this.ar.snapshot.paramMap.get("ID")
    }
    this.p.updatePlayer(player_data);
  }

  deletePlayer() {
    const player_data = {
      ID: this.ar.snapshot.paramMap.get("ID")
    }
    this.p.deletePlayer(player_data);
  }

  ngOnInit() {
   this.playerExists();
   //this.angForm = this.fb.group({ID: [{value: '', disabled : false}]})
  }

  playerExists(){
    const player_data = {
      ID: this.ar.snapshot.paramMap.get("ID")
    }
    this.p.playerExists(player_data).then((response: any) => {
      this.array = response.map((pl) => {
        return pl;
      });
    });
  }

}

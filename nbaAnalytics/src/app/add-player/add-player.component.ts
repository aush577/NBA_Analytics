import { Component, OnInit } from '@angular/core';
import { FormGroup,  FormBuilder,  Validators } from '@angular/forms';
import { PlayerService } from '../player.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-player',
  templateUrl: './add-player.component.html',
  styleUrls: ['./add-player.component.css']
})
export class AddPlayerComponent implements OnInit {
  angForm: FormGroup;
  // IDRedirect = []
  constructor(private fb: FormBuilder, private p: PlayerService, private router: Router) {
    this.createForm();
  }
  
  players: any[] = [];
  nextID = 0;

  createForm() {
    this.angForm = this.fb.group({
      ID: [this.nextID, Validators.required ],
      Name: ['', Validators.required ],
      Weight: [''],
      Height: [''],
      College: [''],
      Nationality: [''],
      Experience: [''],
      PPG: [''],
      RPG: [''],
      APG: [''],
      BPG: [''],
      FT: [''],
      FG: [''],
      TPT: ['' ]
    });
    this.angForm.get('ID').disable();
  }

  createPlayer() {
    var h=0;
    var w=0;
    var e=0;
    var ppg = 0;
    var rpg = 0;
    var apg = 0;
    var bpg = 0;
    var ft = 0;
    var fg = 0;
    var tpt = 0;
    var id = this.nextID;
    var nam = null;
    var nat = null;
    var c = null;

    // if (this.angForm.get('ID').value != "") {
    //   id = this.angForm.get('ID').value;
    // }

    if (this.angForm.get('Height').value != "") {
      h = this.angForm.get('Height').value;
    }
    if (this.angForm.get('Weight').value != "") {
      w = this.angForm.get('Weight').value;
    }
    if (this.angForm.get('Experience').value != "") {
      e = this.angForm.get('Experience').value;
    }
    if (this.angForm.get('Name').value != "") {
      nam = this.angForm.get('Name').value;
    }
    if (this.angForm.get('Nationality').value != "") {
      nat = this.angForm.get('Nationality').value;
    }
    if (this.angForm.get('College').value != "") {
      c = this.angForm.get('College').value;
    }

    if (this.angForm.get('PPG').value != "") {
      ppg = this.angForm.get('PPG').value;
    }
    if (this.angForm.get('RPG').value != "") {
      rpg = this.angForm.get('RPG').value;
    }
    if (this.angForm.get('APG').value != "") {
      apg = this.angForm.get('APG').value;
    }
    if (this.angForm.get('BPG').value != "") {
      bpg = this.angForm.get('BPG').value;
    }
    if (this.angForm.get('FT').value != "") {
      ft = this.angForm.get('FT').value;
    }
    if (this.angForm.get('FG').value != "") {
      fg = this.angForm.get('FG').value;
    }
    if (this.angForm.get('TPT').value != "") {
      tpt = this.angForm.get('TPT').value;
    }

    const player_data = {
      ID: id,
      Name: nam, //this.angForm.get('Name').value,
      Weight: w,
      Height: h,
      College: c, //this.angForm.get('College').value, 
      Nationality: nat, //this.angForm.get('Nationality').value, 
      Experience: e,
      PPG: ppg,
      RPG: rpg,
      APG: apg,
      BPG: bpg,
      FT: ft,
      FG: fg,
      TPT: tpt
    }

    this.p.createPlayer(player_data);

  }


  getNextID(){
    this.p.getNextID().then((response: any) => {
      let array = response.map((i) => {
        // console.log(i);
        return i;
      });
      // console.log(array);
      this.nextID = Math.max(496, array[0]['max_id'] + 1);
      // console.log(this.nextID);
    });
  }

  ngOnInit() {
    this.getNextID();
  }

  // numberOnly(event): boolean {
  //   const charCode = (event.which) ? event.which : event.keyCode;
  //   if (charCode > 31 && (charCode < 48 || charCode > 57)) {
  //     return false;
  //   }
  //   return true;
  // }

  // validatePlayerID() {
  //   // if (this.angForm.get('ID').value < 500) {
  //   //   this.angForm.get('ID').setValue(500);
  //   // }
  //   //this.IDLink[0] = this.angForm.get('ID');
  //   // this.IDRedirect[0] = this.IDLink[0]['value'];
  //   this.IDRedirect[0] = this.nextID; //(this.angForm.get('ID'))['value'];
  // }

}


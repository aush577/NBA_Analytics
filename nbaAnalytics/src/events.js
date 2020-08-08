const express = require('express');

function createRouter(db) {
  const router = express.Router();

  // the routes are defined here
  
  router.post('/player/create', (req, res, next) => {
    db.query(
      'INSERT INTO player (ID, Name, Weight, Height, College, Nationality, Experience) VALUES (?,?,?,?,?,?,?);  \n\
      INSERT INTO player_stats (ID, PPG, RPG, APG, BPG, FT, FG, TPT) VALUES (?,?,?,?,?,?,?,?)',
      [req.body.ID, req.body.Name, req.body.Weight, req.body.Height, req.body.College, req.body.Nationality, req.body.Experience,
      req.body.ID, req.body.PPG, req.body.RPG, req.body.APG, req.body.BPG, req.body.FT, req.body.FG, req.body.TPT],
      (error) => {
        if (error) {
          console.error(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.get('/player/create', function (req, res, next) {
    db.query(
      'SELECT (MAX(ID)) AS max_id FROM player',
      [],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.get('/player/get', function (req, res, next) {
    db.query(
      'SELECT ID, Name, Weight, Height, College, Nationality, Experience FROM player; SELECT ID FROM favorites;   \n\
      SELECT P.ID, P.Name, P.Weight, P.Height, P.Experience, P.College, P.Nationality, S.PPG, S.BPG, S.RPG,   \n\
        S.APG, S.FG, S.FT, S.TPT FROM player P LEFT OUTER JOIN player_stats S ON P.ID=S.ID',
      [],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.put('/player/edit/:ID', function (req, res, next) {
    db.query(
      'UPDATE player P SET P.Name=?, P.Weight=?, P.Height=?, P.College=?, P.Nationality=?, P.Experience=? WHERE P.ID=?;  \n\
      UPDATE player_stats S SET S.PPG=?, S.RPG=?, S.APG=?, S.BPG=?, S.FT=?, S.FG=?, S.TPT=? WHERE S.ID=?',
      [req.body.Name, req.body.Weight, req.body.Height, req.body.College, req.body.Nationality, req.body.Experience, req.params.ID,
      req.body.PPG, req.body.RPG, req.body.APG, req.body.BPG, req.body.FT, req.body.FG, req.body.TPT, req.params.ID],
      (error) => {
        if (error) {
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.delete('/player/edit/:ID', function (req, res, next) {
    db.query(
      'DELETE FROM player WHERE ID=?',
      [req.params.ID],
      (error) => {
        if (error) {
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.get('/player/view/:ID', function (req, res, next) {
    db.query(
      'SELECT * FROM player_stats WHERE ID=?; \n\
      SELECT * FROM player WHERE ID=?;  \n\
      SELECT * FROM injuries WHERE ID=?;  \n\
      SELECT * FROM plays_for WHERE ID=?;   \n\
      SELECT AVG(PPG), AVG(RPG), AVG(APG), AVG(BPG), AVG(FT), AVG(FG), AVG(TPT) FROM favorites NATURAL JOIN player P LEFT OUTER JOIN player_stats S ON P.ID = S.ID; \n\
      SELECT AVG(PPG), AVG(RPG), AVG(APG), AVG(BPG), AVG(FT), AVG(FG), AVG(TPT) FROM player P LEFT OUTER JOIN player_stats S ON P.ID = S.ID; \n\
      SELECT AVG(PPG), AVG(RPG), AVG(APG), AVG(BPG), AVG(FT), AVG(FG), AVG(TPT) FROM player P NATURAL JOIN player_stats S NATURAL JOIN plays_for F WHERE (SELECT Team_City FROM plays_for WHERE ID=?)=F.Team_City;  \n\
      SELECT ID FROM favorites WHERE ID=?; \n\
      SELECT P.ID, FG, TPT, PPG, P.Name FROM player P NATURAL JOIN plays_for F LEFT OUTER JOIN player_stats S ON P.ID = S.ID WHERE (SELECT Team_City FROM plays_for WHERE ID=?) = F.Team_City;   \n\
      SELECT P.ID, FG, TPT, PPG, P.Name FROM player P NATURAL JOIN favorites F LEFT OUTER JOIN player_stats S ON P.ID = S.ID',
      [req.params.ID, req.params.ID, req.params.ID, req.params.ID, req.params.ID, req.params.ID, req.params.ID],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.post('/player/get', (req, res, next) => {
    // console.log(req.body)
    db.query(
      'INSERT INTO favorites (ID) VALUES (?)',
      [req.body.ID],
      (error) => {
        if (error) {
          console.error(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.delete('/player/get', function (req, res, next) {
    db.query(
      'DELETE FROM favorites WHERE ID=?',
      [req.body.ID],
      (error) => {
        if (error) {
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.get('/favorites', function (req, res, next) {
    db.query(
      'SELECT ID, Name FROM favorites NATURAL JOIN player;  \n\
      SELECT ID, Name, Rating FROM recommended NATURAL JOIN player WHERE ID NOT IN (SELECT ID from favorites) ORDER BY Rating ASC LIMIT 10; \n\
      SELECT * FROM percents WHERE percentID=0',
      [],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });
  
  router.put('/favorites', function (req, res, next) {
    db.query(
      'UPDATE percents SET Weight=?, Height=?, Experience=?, PPG=?, RPG=?, APG=?, BPG=?, FT=?, FG=?, TPT=? WHERE percentID=0',
      [req.body.weight, req.body.height, req.body.experience, req.body.ppg, req.body.rpg, req.body.apg, req.body.bpg, req.body.ft, req.body.fg, req.body.tpt],
      (error) => {
        if (error) {
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json({status: 'ok'});
        }
      }
    );
  });

  router.get('/player/edit/:ID', function (req, res, next) {
    db.query(
      'SELECT * FROM player_stats WHERE ID=?',
      [req.params.ID],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.get('/teams', function (req, res, next) {
    db.query(
      'SELECT * FROM team',
      [],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.get('/teams/view/:City', function (req, res, next) {
    db.query(
      'SELECT ID, Name, Team_Name FROM team NATURAL JOIN plays_for NATURAL JOIN player WHERE Team_City=?',
      [req.params.City],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });

  router.get('/injuries', function (req, res, next) {
    db.query(
      'SELECT ID, Name, Date, Type, Status FROM injuries NATURAL JOIN player; \n\
       SELECT Type, COUNT(Type) FROM injuries GROUP BY Type; \n\
       SELECT Status, COUNT(Status) FROM injuries GROUP BY Status',
      [],
      (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
    );
  });


  return router;
}

module.exports = createRouter;
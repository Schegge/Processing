class Ludwig {

  float w = width/1.4;
  float h = height/3;
  
  int faceW = 50;
  float faceH = faceW*1.6;

  // BODY
  
  float[][] body = {
    { -0.8  , 0    },
    { -0.55 , 1.05 },
    { -2.2  , 1.21 },
    { -2.4  , 1.31 },
    { -2.45 , 1.51 },
    { -2.3  , height/faceH }
  };
  
  float[] shirt = { 0, body[1][1]+0.2 };
  
  float[][] coat = {
    {  0   , body[1][1]+1.5 },
    { -0.4 , body[1][1]+0.8 }
  };
  
  float[][] collar = {
    shirt,
    { -0.65, 1.05 },
    body[2],
    { -0.3 , shirt[1]+0.25 },
    shirt
  };
  
  float[][] tie = {
    {         0   , shirt[1]+0.05 },
    { collar[3][0], shirt[1]-0.05 },
    {        -0.12, collar[3][1]  },
    { collar[3][0], coat[0][1]    }
  };
  
  // FACE
  
  float[][] face = {
    { -0.8 , -0.6 },
    { -1   ,  0   },
    { -0.8 ,  0.6 },
    { -0.2 ,  1   }
  };
  
  float[][] ear = {
    { -1    , 0    },
    { -1.08 , 0.02 },
    { -1.13 , 0.05 },
    { -1.18 , 0.2  },
    { -0.93 , 0.48 },
    { -0.8  , 0.46 }
  };
  
  float[][] hair = {
    {  0    , -0.8  },
    { -0.5  , -0.7  },
    { -0.8  , -0.6  },
    { -1    , -0.4  },
    { -1.05 , -0.2  },
    { -0.9  ,  0.4  },
    { -0.8  ,  0.45 },
    { -0.9  , -0.1  },
    { -0.7  , -0.4  },
    {  0    , -0.3  }
  };
  
  float eyeRef = 0.05;
  float[][] eye = {
    { -0.18 , eyeRef },    
    { -0.62 , eyeRef },
    { -0.58 , 0.17   },
    { -0.21 , 0.17   }
  };
  
  float[] pupil = {
    ( faceW*eye[0][0] + faceW*eye[1][0] ) / 2,
    ( faceH*eye[0][1] + faceH*eye[2][1] ) / 2
  };
  
  float[][] eyebrow = {
    { -0.12 ,  0.02 },
    { -0.15 , -0.05 }, 
    { -0.71 , -0.14 }
  };
  
  float[][] blush = {    
    { -0.18 , 0.23 },
    { -0.23 , 0.33 },
    { -0.30 , 0.25 },
    { -0.35 , 0.35 },    
    { -0.42 , 0.26 },
    { -0.47 , 0.33 },
    { -0.54 , 0.23 },
    { -0.59 , 0.31 }
  };
  
  float[][] nose = {
    {  0    , 0.15 },
    { -0.02 , 0.25 },
    { -0.06 , 0.38 },
    { -0.02 , 0.47 },
    {  0    , 0.5  }
  };
  
  float[][] mouth = {
    {          0   , 0.62 },
    { pupil[0]*0.6 , 0.6  },
    { pupil[0]*0.8 , 0.65 },
    { pupil[0]*0.85, 0.7  },
    { pupil[0]*0.8 , 0.75 },
    { pupil[0]*0.7 , 0.8  },
    {          0   , 0.78 }
  };
  
  // ANIMATION
  
  boolean closeEyes = false;  
  float closeEyesUnit = 0.01;
  float mouthUnit = 0.003;
  
  void update() {
    
    if ( closeEyes ) {
      eye[0][1] += closeEyesUnit;
      eye[1][1] += closeEyesUnit;
      if ( eye[1][1] >= eye[2][1]) {
        closeEyesUnit = -closeEyesUnit;
      }
      if ( closeEyesUnit < 0 && eye[1][1] <= eyeRef ) {
        closeEyesUnit = -closeEyesUnit;
        eye[0][1] = eyeRef;
        eye[1][1] = eyeRef;
        closeEyes = false;
      }
    }
    
    for ( int i = 0; i < mouth.length; i++ ) {
      if ( i <= 2 ) mouth[i][1] += mouthUnit;
      if ( i >= 4 ) mouth[i][1] -= mouthUnit;
    }
    if ( mouth[0][1] > 0.68 || mouth[0][1] < 0.6 ) {
      mouthUnit = -mouthUnit;
    }
    
  }
  
  // DESIGN  
  
  void drawing() {
    pushMatrix();
      translate(w, h);
      
      // body
      fill(#EDCAB6);
      beginShape();
        for ( int i = 0; i < body.length; i++ ) {
          vertex(faceW*body[i][0], faceH*body[i][1]);
        }
        for ( int i = body.length-1; i >= 0; i-- ) {
          vertex(-faceW*body[i][0], faceH*body[i][1]);
        }
      endShape();
      
      // shirt
      fill(#ffffff);
      beginShape();
        vertex(faceW*shirt[0], faceH*shirt[1]);
        for ( int i = 1; i < body.length; i++ ) {
          vertex(faceW*(body[i][0]-0.1), faceH*body[i][1]);
        }
        for ( int i = body.length-1; i >= 1; i-- ) {
          vertex(-faceW*(body[i][0]-0.1), faceH*body[i][1]);
        }
      endShape();
      
      // tie
      fill(200);
      beginShape();
        for ( int i = 0; i < tie.length; i++ ) {
          vertex(faceW*tie[i][0], faceH*tie[i][1]);
        }
        for ( int i = tie.length-1; i >= 0; i-- ) {
          vertex(-faceW*tie[i][0], faceH*tie[i][1]);
        }
      endShape();
      
      // collar
      fill(230);
      beginShape();
        for ( int i = 0; i < collar.length; i++ ) {
          vertex(faceW*collar[i][0], faceH*collar[i][1]);
        }
        for ( int i = collar.length-1; i >= 0; i-- ) {
          vertex(-faceW*collar[i][0], faceH*collar[i][1]);
        }
      endShape();
      
      // coat
      fill(110);
      beginShape();
        vertex(faceW*coat[0][0], faceH*coat[0][1]);
        vertex(faceW*coat[1][0], faceH*coat[1][1]);
        for ( int i = 1; i < body.length; i++ ) {
          vertex(faceW*(body[i][0]-0.15), faceH*(body[i][1]-0.01));
        }
        for ( int i = body.length-1; i >= 1; i-- ) {
          vertex(-faceW*(body[i][0]-0.15), faceH*(body[i][1]-0.01));
        }        
        vertex(-faceW*coat[1][0], faceH*coat[1][1]);
      endShape();
      
      // face
      fill(#FAE0CF);
      beginShape();
        for ( int i = 0; i < face.length; i++ ) {
          vertex(faceW*face[i][0], faceH*face[i][1]);
        }
        for ( int i = face.length-1; i >= 0; i-- ) {
          vertex(-faceW*face[i][0], faceH*face[i][1]);
        }
      endShape();
      
      // ears
      fill(#FAE0CF);
      beginShape();
        for ( int i = 0; i < ear.length; i++ ) {
          vertex(faceW*ear[i][0], faceH*ear[i][1]);
        }
      endShape();      
      beginShape();
        for ( int i = 0; i < ear.length; i++ ) {
          vertex(-faceW*ear[i][0], faceH*ear[i][1]);
        }
      endShape();
            
      // hair
      fill(#FFD83B);
      beginShape();
        for ( int i = 0; i < hair.length; i++ ) {
          vertex(faceW*hair[i][0], faceH*hair[i][1]);
        }
        for ( int i = hair.length-1; i >= 0; i-- ) {
          vertex(-faceW*hair[i][0], faceH*hair[i][1]);
        }
      endShape();
      
      // eyes
      eyes(1);
      eyes(-1);
      
      // eyebrows
      fill(#FFD83B);
      beginShape();
        for ( int i = 0; i < eyebrow.length; i++ ) {
          vertex(faceW*eyebrow[i][0], faceH*eyebrow[i][1]); 
        }
      endShape();
      beginShape();
        for ( int i = eyebrow.length-1; i >= 0 ; i-- ) {
          vertex(-faceW*eyebrow[i][0], faceH*eyebrow[i][1]); 
        }
      endShape();
      
      // blush
      pushStyle();
        stroke(#F2A4AA);
        strokeWeight(1);
        beginShape(LINES);
          for ( int i = 0; i < blush.length; i++ ) {
            vertex(faceW*blush[i][0], faceH*blush[i][1]); 
          }
        endShape();
        beginShape(LINES);
          for ( int i = 0; i < blush.length; i++ ) {
            vertex(-faceW*blush[i][0], faceH*blush[i][1]); 
          }
        endShape();
      popStyle();
      
      // nose
      pushStyle();
        noFill();
        stroke(#E8BA9F);
        strokeWeight(1);
        beginShape();
          for ( int i = 0; i < nose.length; i++ ) {
            vertex(faceW*nose[i][0], faceH*nose[i][1]);
          }
        endShape();
      popStyle();
      
      // mouth
      fill(#F0B9A9);
      beginShape();
        for ( int i = 0; i < mouth.length; i++ ) {
          vertex(mouth[i][0], faceH*mouth[i][1]);
        }
        for ( int i = mouth.length-1; i >= 0; i-- ) {
          vertex(-mouth[i][0], faceH*mouth[i][1]);
        }
      endShape();
      
    popMatrix();
  }
  
  void eyes ( int seg ) {  
    float[][] pupils = {
      { pupil[0]*0.9, faceH*eye[0][1] },
      { pupil[0]*1.1, faceH*eye[0][1] },
      { pupil[0]*1.2, pupil[1]        },
      { pupil[0]*1.1, faceH*eye[2][1] },
      { pupil[0]*0.9, faceH*eye[2][1] },
      { pupil[0]*0.8, pupil[1]        }
    };
  
    fill(#FFFFFF);
    beginShape();
      for ( int i = 0; i < eye.length; i++ ) {
        vertex(seg*faceW*eye[i][0], faceH*eye[i][1]);
      }
    endShape();
    
    fill(#56D3D6);
    beginShape();
      for ( int i = 0; i < pupils.length; i++ ) {
        vertex(seg*pupils[i][0], pupils[i][1]);
      }
    endShape();
      
    pushStyle();
      stroke(#EDCAB6);     
      strokeWeight(1);
      beginShape(LINES);
        for ( int i = 0; i < eye.length; i++ ) {
          vertex(seg*faceW*eye[i][0], faceH*eye[i][1]);
        }
      endShape();
    popStyle();
    
  }

}

int[][] matrix = {
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
};

int cellSize = 25;
boolean isEditing = false;

void setup(){
  size(700, 700);
  frameRate(5);
}


void draw(){
  background(0);
  drawMatrix();
  if(!isEditing)
    ApplyConwayRule();
  
  
}

void drawMatrix(){
  for(int i=0; i<matrix.length; i++){
 
    for(int j=0; j<matrix[i].length; j++){
      
      if(matrix[i][j] == 0)
        fill(155);
      else
        fill(0);
        
      rect(j*cellSize, i*cellSize, cellSize,cellSize);
    }
  }
}


void ApplyConwayRule(){
  int[][] nextGeneration = cloneArray(matrix);
  
  for(int i=0; i<matrix.length; i++){
    for(int j=0; j<matrix[i].length; j++){
      
      Cell cur_cell = new Cell(i,j, matrix[i][j]);
       
      ArrayList<Cell> cur_neighbors = getNeighbors(cur_cell);
      int total_live_N = 0;
       
      for(Cell n:cur_neighbors)
        total_live_N += n.value;
       
      if(matrix[i][j] == 1 && (total_live_N < 2 || total_live_N > 3))
        nextGeneration[i][j] = 0;
      
      if(matrix[i][j] == 0 && total_live_N == 3)
        nextGeneration[i][j] = 1;

    }
  }
  
  matrix = cloneArray(nextGeneration);
  
}

ArrayList<Cell> getNeighbors(Cell cell){
  ArrayList<Cell> neighbors = new ArrayList<Cell>();
  
  int i = cell.i, j = cell.j;
  
  
  //left
  if(j-1 >= 0)
    neighbors.add(new Cell(i,j, matrix[i][j-1]));
  
  //right
  if(j+1 <= matrix[i].length-1)
    neighbors.add(new Cell(i,j, matrix[i][j+1]));
    
    
  //up
  if(i-1 >= 0)
    neighbors.add(new Cell(i,j, matrix[i-1][j]));
  
  
  //down
  if(i+1 <= matrix.length-1)
    neighbors.add(new Cell(i,j, matrix[i+1][j]));
  
  
  //diagonal up right
  if( (i-1 >= 0) && (j+1 <= matrix[i].length-1) )
    neighbors.add(new Cell(i,j, matrix[i-1][j+1]));
  
  //diagonal down right
  if( (i+1 <= matrix.length-1) && (j+1 <= matrix[i].length-1) )
    neighbors.add(new Cell(i,j, matrix[i+1][j+1]));
 
  //diagonal up left
  if( (i-1 >= 0) &&  (j-1 >= 0) )
    neighbors.add(new Cell(i,j, matrix[i-1][j-1]));
  
  //diagonal down left
  if( (i+1 <= matrix.length-1) &&  (j-1 >= 0) )
    neighbors.add(new Cell(i,j, matrix[i+1][j-1]));
  
  return neighbors;
  
}


public static int[][] cloneArray(int[][] src) {
    int length = src.length;
    int[][] target = new int[length][src[0].length];
    for (int i = 0; i < length; i++) {
        System.arraycopy(src[i], 0, target[i], 0, src[i].length);
    }
    return target;
}



void mousePressed(){
 if(isEditing){
   int i = int(mouseY/cellSize), j = int(mouseX/cellSize);
   println(i,j); 
   matrix[i][j] = (matrix[i][j] == 0)?1:0;
 }
 
 
 
}

void clearBoard(){
  for(int i=0; i<matrix.length; i++)
    for(int j=0; j<matrix[i].length; j++)
      matrix[i][j] = 0;
      
}

void giveRandomLife(){
  for(int c=0; c<matrix.length*matrix[0].length; c++){
    int 
    ri = int(random(matrix.length)),
    rj = int(random(matrix[0].length));
    
    matrix[ri][rj] = 1;
      
  }
}

void keyPressed(){
  if(keyCode == SHIFT)
    isEditing = true;
  else if(key == 'c')
    clearBoard();
  else if(key == 'r'){
   //clearBoard();
   giveRandomLife(); 
  }
}

void keyReleased(){
  if(keyCode == SHIFT)
    isEditing = false;
}

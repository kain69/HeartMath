float c = 0;
float n = 0;
void setup(){
 size(720, 720);
 colorMode(HSB,100);
 noFill();
}

void draw(){
  background(0);
  
  c += 0.5;
  float x = width/2;  // Начинать из центра
  float y = height/2.7; // Начинать из центра
  
  
  for(int i = 0; i < 200; i++){
    float p = pow(0.96, i);                             // Коэфициент толщины и размеров для иллюзии глубины
    float r = noise((i+c)*0.03)*0.1;                                   // Какая-то математическая магия для рисования траектории
    x += cos(r)*1.5;
    y += sin(r)*3;
    
    stroke((n+i*2)%45,y,x); // Устанавливается цвет линии
    strokeWeight(1*p);      // Устанавливается толшина линии
    
    beginShape();
    for (float a = 0; a < TWO_PI; a+= 0.01) {
      float q = x;
      float w = y;
      q += p*50 * 16 * pow(sin(a), 3);
      w += -1*p*50 * (13 * cos(a) - 5*cos(2*a) - 2*cos(3*a) - cos(4*a));
      vertex(q, w);
    }
    endShape();
    n += 0.01; // Сменять цвет линии
  }
}

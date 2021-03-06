float c = 0;
float n = 0;
void setup(){
 size(720, 720);
 colorMode(HSB,255);
 noFill();
}

void draw(){
  background(0);
  
  c += 0.2;
  float x = width/2;  // Начинать из центра
  float y = height/2; // Начинать из центра
  
  for(int i = 0; i < 100; i++){
    float p = width*sqrt(2)*pow(0.92, i);                             // Коэфициент толщины и размеров для иллюзии глубины
    float r = 3*noise((i+frameCount*0.5)*0.03)*TAU;                   // Шум Перлинга
    x += cos(r)*2;
    y += sin(r)*2;
    
    stroke((n+i*2)%255,y,x); // Устанавливается цвет линии
    strokeWeight(10*p);      // Устанавливается толшина линии
    
    beginShape();
    for (float a = 0; a < TWO_PI; a+= 0.01) {
      float q = x;
      float w = y;
      q += p * 10 * 16 * pow(sin(a), 3);
      w += -1*p*10 * (13 * cos(a) - 5*cos(2*a) - 2*cos(3*a) - cos(4*a));
      vertex(q, w);
    }
    endShape();
    n += 0.01; // Сменять цвет линии
  }
}

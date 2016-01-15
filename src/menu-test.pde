#include "Command.h"

#define MAP(X,Y) Map.insert(std::pair<String,func>(String(X), Y))

int Tjena(int argc, struct CommandParser::arg argv[])
{
  Serial.println("TJENA MITTBENA");

  for (int i = 1; i < argc; i++) {
    Serial.print("Arg ");
    Serial.print(i);
    Serial.print(": ");
    Serial.println(argv[i].f);
  }
  return 0;
}

int Hej(int argc, struct CommandParser::arg argv[])
{
  Serial.println("TJABBA!");
  Serial.print("Hej argc: "); Serial.println(argc);
  Serial.print("Hej arg1: "); Serial.println(argv[1].f);
  Serial.print("Hej arg2: "); Serial.println(argv[2].f);
  return 0;
}

CommandParser *Menu = new CommandParser(&Serial);

typedef int (*func)(int argc, struct CommandParser::arg argv[]);
std::map<String, func, CommandParser::cmpStrings> Map;

void setup()
{
  Serial.begin(115200);

  SetupMenu();
  Menu->init(Map);
}

void loop()
{
  Menu->CheckPort();
}

void SetupMenu()
{
  //Map.insert(std::pair<String,func>(String("BAJS"), &bajsa));
  //Map.insert(std::pair<String,func>(String("TJENA"), &Tjena));

  //Map[String("BAJS")] = &bajsa;
  //Map[String("TJENA")] = &Tjena;
  MAP("HEJ", Hej);
  MAP("TJENA", Tjena);

  Serial.print("Map size: "); Serial.println(Map.size());
}

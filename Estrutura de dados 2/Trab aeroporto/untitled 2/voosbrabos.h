#ifndef VOOSBRABOS_H
#define VOOSBRABOS_H
#include <iostream>
#include "vectorzada.h"
#include <string>
#include <stdio.h>
#include <vector>
using namespace std;

class voosBrabos
{
public:
    string voo;
    vector<string> partida, chegada, tempoViagem;
    int minPartida, minChegada, minTempoViagem;
    void set(string voo, string partida, string chegada);
    voosBrabos();
    void print();
};

#endif // VOOSBRABOS_H

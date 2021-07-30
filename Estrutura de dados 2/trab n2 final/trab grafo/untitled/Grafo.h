#ifndef RACIONAL_H
#define RACIONAL_H
#include <iostream>
#include <queue>
#include <vector>
#include <bits/stdc++.h>
#include <utility>
#include <functional>
#include "nodezin.h"
#include <string>
#include <stdio.h>
using namespace std;

class Grafo
{
    public:
    int N;
    nodezin ** M;
    Grafo(int n);
    ~Grafo();
    void InsereAresta(int u, int v, string p, string c, string voo);
    void RemoveAresta(int u, int v);
    bool TemAresta(int u, int v);
    int GrauPartida(int u);
    int GrauChegada(int u);
    int PopularPartida();
    int PopularChegada();
    void InitializeSingleSource(int s, int* d, int* p);
    void Relax(int u, int v, int* d, int* p, int w);
    void Dijkstra(int s, int*d, int* p);
    void print();

};

#endif // RACIONAL_H

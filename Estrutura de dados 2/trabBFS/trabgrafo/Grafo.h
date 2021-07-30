#ifndef RACIONAL_H
#define RACIONAL_H
#include <iostream>
#include <queue>

class Grafo
{
    public:
    int N;
    int ** M;
    Grafo(int n);
    ~Grafo();
    void InsereAresta(int u, int v);
    void RemoveAresta(int u, int v);
    bool TemAresta(int u, int v);
    void BFS(int s, int* d, int* p);
    int Grau(int u);
    int Popular();
};

#endif // RACIONAL_H

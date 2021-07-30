#include "Grafo.h"


Grafo::Grafo(int n)
{
    N=n;
    M = new nodezin*[N];
    for(int i=0; i<N; i++)
    {
        M[i] = new nodezin [N];
    }

    /*  desnecessario pq o construtor
        ja coloca false em todas*/

    //    for(int i=0;i<N;i++){
    //        for(int j=0;j<N;j++)
    //             M[i][j].aresta=false;
    //    }
}

Grafo::~Grafo()
{
    for(int i=0; i<N; i++)
        delete []M[i];
    delete []M;
}

void Grafo::InsereAresta(int u, int v, string p, string c, string voo)
{
    M[u][v].set(voo,p,c);
//    M[u][v].aresta=true;
//    M[u][v].chegada=c;
//    M[u][v].partida=p;
//    M[u][v].voo=voo;
}
void Grafo::RemoveAresta(int u, int v)
{
    M[u][v].remove();
//    M[u][v].chegada=M[u][v].partida=M[u][v].voo="";
//    M[u][v].aresta=false;
}
bool Grafo::TemAresta(int u, int v)
{
    return M[u][v].aresta;
}

int Grafo::GrauPartida(int u)
{
    int cont;
    for(int i=cont=0; i<N; i++)
    {
        cont+=M[u][i].aresta;
    }
    return cont;
}

int Grafo::GrauChegada(int u)
{
    int cont;
    for(int i=cont=0; i<N; i++)
    {
        cont+=M[i][u].aresta;
    }
    return cont;
}

int Grafo::PopularPartida()
{
    int Maior=0;
    int P,Aux;
    for(int i=0; i<N; i++)
    {
        Aux=GrauPartida(i);
        if(Aux>Maior){
            Maior = Aux;
            P = i;
        }
    }
    return P;
}

int Grafo::PopularChegada()
{
    int Maior=0;
    int P,Aux;
    for(int i=0; i<N; i++)
    {
        Aux=GrauChegada(i);
        if(Aux>Maior){
            Maior = Aux;
            P = i;
        }
    }
    return P;
}

void Grafo::print()
{
    for (int i=0;i<N;i++)
    {
        for (int j=0; j<N;j++)
        {
            if (TemAresta(i,j))
            {
                M[i][j].print();
            }
        }
    }
}

void Grafo::InitializeSingleSource(int s, int *d, int *p)
{
    for(int i=0; i<N; i++)
    {
        d[i]=INT_MAX/2;
        p[i]=-1;
    }
    d[s]=0; //s é o vertice de inicio!
}

void Grafo::Relax(int u, int v, int *d, int *p, int w)
{//arrumar
    //u é a partida, v é chegada
    if (p[u]!=-1)
    {
        int minEspera=M[u][v].minPartida-M[p[u]][u].minChegada;

        if (minEspera < 0)
            minEspera +=1440;

        if(d[v]>d[u]    +minEspera   +w) // usando matriz de adjacência.
        {//if(d[v]>d[u]+w) // usando lista de adjacência passando o peso de (u,v) por parâmetro w
            d[v] = d[u] + w + minEspera;
            p[v] = u;
        }
    }
    else
    {
        if(d[v]>d[u]    /*+minEspera*/   +w) // usando matriz de adjacência.
        {//if(d[v]>d[u]+w) // usando lista de adjacência passando o peso de (u,v) por parâmetro w
            d[v] = d[u] + w /*+ minEspera*/;
            p[v] = u;
        }
    }
}

void Grafo::Dijkstra(int s, int *d, int *p)
{
    //First é o peso, e o Second é o index do vertice
    priority_queue<pair<int,int>, vector<pair<int, int>>, greater <pair<int, int>> > Q;
    InitializeSingleSource(s, d, p);
    for(int i=0;i<N; i++)
    {
        Q.push(make_pair(d[i], i));
    }
    int u;
    //First é o index do vertice, e o Second é o peso
    while (!Q.empty())
    {
        u = Q.top().second;
        for(int k=0; k<N; k++)
        {
            if (TemAresta(u,k))
            {
                Relax(u, k, d, p, M[u][k].minTempoViagem);
            }
        }
        Q.pop();
    }
}

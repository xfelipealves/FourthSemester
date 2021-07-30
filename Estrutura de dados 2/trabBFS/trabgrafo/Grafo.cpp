#include "Grafo.h"


Grafo::Grafo(int n)
{
    N=n;
    M = new int*[N];
    for(int i; i<N; i++)
    {
        M[i] = new int [N];
    }
    for(int i=0;i<N;i++){
        for(int j=0;j<N;j++)
             M[i][j]=0;
    }
}

Grafo::~Grafo()
{
     for(int i=0; i<N; i++)
          delete []M[i];
     delete []M;
}

void Grafo::InsereAresta(int u, int v)
{
     M[u][v]=M[v][u]=1;
}
void Grafo::RemoveAresta(int u, int v)
{
     M[u][v]=M[v][u]=0;
}
bool Grafo::TemAresta(int u, int v)
{
    return M[u][v];
}

void Grafo::BFS(int s, int *d, int *p)
{
    char c[N];
    for(int i=0; i<N; i++)
    {
        d[i]=INT_MAX;
        p[i]=-1;
        c[i]='w';//collor
    }
    d[s]=0;
    std::queue<int> Q;
    Q.push(s);
    c[s]='g';
    int u,v;
    while(!Q.empty())
    {
        u=Q.front();
        for(int i=0; i<N; i++)
        {
            if(M[u][i]==1)
            {
                v=M[u][i];
                if(c[v]=='w')
                {
                    Q.push(v);
                    c[v]='g';
                    p[v]=u;
                    d[v]=d[u]+1;
                }
            }
        }
        c[u]='b';
        Q.pop();
    }
}

int Grafo::Grau(int u)
{
   int cont;
   for(int i=cont=0; i<N; i++)
   {
        cont+=M[u][i];
   }
   return cont;
}
int Grafo::Popular()
{
    int Maior=0;
    int P,Aux;
    for(int i=0; i<N; i++)
    {
        Aux=Grau(i);
        if(Aux>Maior){
                Maior = Aux;
                P = i;
        }
   }
   return P;
}

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
//    M[u][v].remove();
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

bool Grafo::Relax(int u, int v, int *d, int *p, int w, int* index, int c)
{
//    int vd = d[v];
//    int vt= d[u]+w;
    if(d[v]>(d[u] + w)) // usando matriz de adjacência.
    {//if(d[v]>d[u]+w) // usando lista de adjacência passando o peso de (u,v) por parâmetro w
//        if (u==4 and v==3 )
//            cout<<"porra!"<<endl;
        d[v] = d[u] + w;
        p[v] = u;
        index[v] = c; //seto o novo index, indicando de qual aresta ele veio!
        return true;
    }
    return false;
}

void Grafo::Dijkstra(int s, int *d, int *p, int* index)
{
    //First é o peso, e o Second é o index do vertice
    priority_queue<pair<int,int>, vector<pair<int, int>>, greater <pair<int, int>> > Q;
    InitializeSingleSource(s, d, p);

    Q.push(make_pair(d[s],s));

    for(int i=0;i<N; i++)
    {
        //Q.push(make_pair(d[i], i));
        index[i]=-1;
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
                int c=0;
                for (list<voosBrabos>::iterator it=M[u][k].voozin.begin(); it!=M[u][k].voozin.end(); ++it, c++)
                {
                    bool agarantir=true;

                    //cout<<"passei"<<endl;
                    int minTotal=0;

                    if (p[u]!=-1)
                    {//Ele não é o primeiro! Logo, deve se buscar o tempo de espera!
                        //o index de u também nao é -1, logo ele tem uma aresta de chegada

                        list<voosBrabos>::iterator itZ=M[p[u]][u].voozin.begin();
                        for (int val=0; itZ!=M[p[u]][u].voozin.end() && val!=index[u]; itZ++, val++);

                        minTotal=it->minPartida-itZ->minChegada;
                        if (minTotal < 0)
                            minTotal +=1440;


                        if (minTotal < 30)
                        {//O tempo de espera é menor q 30, logo, n tem q como RELAXAR (pegar) esse voo
                            agarantir=false;
                        }
                    }
                    minTotal+=it->minTempoViagem;

                    if (agarantir)
                    {
                        if(Relax(u, k, d, p, minTotal, index, c))
                            Q.push(make_pair(d[k],k));
                    }
                }
            }
        }
        Q.pop();
    }
}

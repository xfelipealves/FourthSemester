#include <iostream>
#include <fstream>
#include <vector>
#include "Grafo.h"
using namespace std;

int maior(int *v, int n)
{
    int maior=v[0];
    for (int i=1;i<n;i++)
    {
        if (v[i]>maior)
            maior=v[i];
    }
    return maior;
}

int main()
{
    vector<string> grafos;
    string x;
    ifstream arq1("trab");

    while (!arq1.eof())
    {//INSERINDO VERTICES
        getline(arq1,x);
        if (x=="")
            break;
        grafos.push_back(x);
    }

    Grafo cleiton(grafos.size());
    while(!arq1.eof())
    {//INSERINDO ARESTAS
        getline(arq1,x);
        if (x=="")
            break;

        string linha;
        int l;
        string coluna;
        int c;

        int i;

        for (i=0;x[i]!=' ';i++)
        {//lendo a linha de X
            linha[i]=x[i];//PASSOU A LINHA
        }


        for (int k=0;k<grafos.size();k++)
        {
            if (grafos[k]==linha)
                l=k;//pegando a posicao da origem/linha
        }

        i=i+3;
        while (i<x.size())
        {//PASSAR COLUNAS
            for (int g=0; i<x.size() and x[i]!=' '; i++,g++)
            {
                coluna[g]=x[i];
            }

            for (int k=0;k<grafos.size();k++)
            {
                if (grafos[k]==coluna)
                    c=k;//pegando a posicao do destino/coluna
            }

            cleiton.InsereAresta(l,c);

            i=i+3;
        }

    }

    while(!arq1.eof())
    {//CONSULTANDO AS BFS COM ORIGEM E DESTINO
        getline(arq1,x);
        if(x=="")
            break;

        string origem;
        string destino;

        int i=0;
        for (;x[i]!=' ';i++)
        {//lendo a origem em x
            origem[i]=x[i];//PASSOU A ORIGEM
        }
        i=i+3;
        for (int g=0;i<x.size();i++,g++)
        {//lendo o destino em x
            destino[g]=x[i];//PASSOU O DESTINO
        }

        int s,q; //S==Origem Q==Desitno

        for (int k=0;k<grafos.size();k++)
        {
            if (grafos[k]==origem)
                s=k;//pegando a posicao da origem
        }

        if (destino[i-1]!='.' and destino[i-3]!='2' and destino[i-2]!='5' and destino[i-1]!=5)
        {
            for (int k=0;k<grafos.size();k++)
            {
                if (grafos[k]==destino)
                    q=k;//pegando a posicao do destino
            }
        }
        else
        {
            q=-1;//destino invalido
        }

        int* d;
        int* p;
        cleiton.BFS(s,d,p);
        cout<<origem;
        if (q!=-1)
        {
            int l[d[q]];//largura
            l[d[q]-1]=q;//destino
            for (int z=d[q]-2; z>=0 ;z--)
            {
                l[z]=p[z]+1;
            }

            for (int z=0;z<d[q];z++)
            {
                cout<<" , "<<grafos[l[z]];
            }
            cout<<endl;
        }
        else
        {
            int tamanho=maior(d,grafos.size());
            for (int z=1; z<=tamanho; z++)
            {
                for (int y=0; y<grafos.size(); y++)
                {

                    if (d[y]==z)
                    {
                        cout<<origem;
                        int l[z];//pais;
                        l[z-1]==d[y];
                        for (int h=z-2;h>=0;h--)
                        {
                            l[h]=p[h]+1;
                        }
                        for (int h=z;h>=0;h--)
                        {
                            cout<<" , "<<grafos[l[h]];
                        }
                        cout<<endl;
                    }
                }
            }
        }
    }

}

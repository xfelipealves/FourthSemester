#include <iostream>
#include <fstream>
#include <vector>
#include <stdio.h>
#include <time.h>
#include <list>
#include <iomanip>
#include "Grafo.h"
#include <stdio.h>
#include <stack>

#include <string.h>

using namespace std;

/*
TP1982 Porto 09:00 Madrid 11:00
IB8717 Madrid 12:00 LasPalmasGranCanaria 15:00 15:30 SantaCruzTenerife 16:20
TP1985 Porto 09:30 Lisboa 10:30
PGA102 Lisboa 12:40 SantaCruzTenerife 16:00 16:30 LasPalmasGranCanaria 17:20
*/

/* Porto 0    Madrid 1     LasPalmas 2      SantaCruz 3      Lisboa 4 */


//ifstream arq1("trab"); LEITURA DO ARQUIVO
//eof
//getline(arq1,destino)

int main()
{
    /*----------------------------------------------*/
            //LEITURA DO ARQUIVO DE ENTRADA
    /*----------------------------------------------*/
    ifstream entrada("entrada.txt");


    vector<string> locais;
    string aux;
//    int cont=0;
    while (!entrada.eof())
    {
        getline(entrada,aux);
        vector<string> v{explode(aux,' ')};
        if (v[0]!="")
        {

//            cont=cont+2;
//            locais.push_back(v[1]);
//            locais.push_back(v[3]);

            vector<string>::iterator it;
            it = find (locais.begin(), locais.end(), v[1]);
            if (it==locais.end())
            {//Não encontrou no vetor, entao pode xuxar
//                cont++;
                locais.push_back(v[1]);
            }

            for (int i=3;i<v.size();i=i+3)
            {
//                cont=cont+1;
//                vector<string>::iterator it;
                it = find (locais.begin(), locais.end(), v[i]);
                if (it==locais.end())
                {//Não encontrou no vetor, entao pode xuxar
                    locais.push_back(v[i]);
                }
            }
//            for (int i=0; i<v.size();i++)
//            {
//                cout<<v[i]<<" ";
//            }
//            cout<<endl<<locais.size()<<endl;
        }
//        cout<<endl;
//        cout<<cont<<endl;
    }
    entrada.close();

//    string al="Lisboa";
//    int i=0;
//    for (;i<locais.size() and locais[i]!=al;i++);
//    if (i<locais.size() and locais[i]==al)
//    {
//        cout<<i<<endl<<endl;
//    }

    /*----------------------------------------------*/
   //instanciação do grafo e releitura de arquivo entrada
    /*----------------------------------------------*/
    Grafo aeroportos(locais.size());
    ifstream entrada2("entrada.txt");

    while (!entrada2.eof())
    {
        getline(entrada2,aux);
        vector<string> v{explode(aux,' ')};
        //v[0] tem SEMPRE O nome o voo!
        int uz=0; int vz=0;
        for (;uz<locais.size() and locais[uz]!=v[1];uz++); //uz vai ter a posicao da primeira partida
        for (;vz<locais.size() and locais[vz]!=v[3];vz++); //vz vai ter a posicao da primeira chegada
        aeroportos.InsereAresta(uz,vz,v[2],v[4],v[0]); //inseriu a aresta
        //aeroportos.M[uz][vz].print();//validacao

        for (int k=5;k<v.size();k=k+3)
        {//tem mais voos (conexoes)
            uz=vz; vz=0;//uz é o nova local de PARTIDA (k-2)
            //k indica SEMPRE o HORARIO de SAIDA
            //k + 1 indica sempre o DESTINO (local de CHEGADA)
            //k + 2 indica sempre o HORARIO de CHEGADA

            //vz precisa receber o index do Destino
            for (;vz<locais.size() and locais[vz]!=v[k+1];vz++);
            aeroportos.InsereAresta(uz,vz,v[k],v[k+2],v[0]);
            //aeroportos.M[uz][vz].print();//validacao
        }

    }
    entrada2.close();

    /*----------------------------------------------*/
      /* validacao do que foi instanciado no grafo */
    /*----------------------------------------------*/
    //aeroportos.print();

    /*----------------------------------------------*/
             //iniciacao das entradas do cmd
    /*----------------------------------------------*/
    cout<<"Pograma de Viajens com j msm"<<endl;

    cout<<endl<<"Os aeroportos sao esses ai o: "<<endl;
    for (int i=0;i<locais.size();i++)
    {
        cout<<locais[i]<<" ";
    }
    cout<<endl<<endl;
    cout<<"Tu quer ir pra onde? ";
    string destino; int s2=0;
    cin>>destino;
    for (;s2<locais.size() and locais[s2]!=destino;s2++);

    cout<<"De onde tu vai sair? ";
    string partida; int s3=0;
    cin>>partida;
    for (;s3<locais.size() and locais[s3]!=partida;s3++);

//    cout<<destino<<" "<<s2<<endl; /*Os dados estão certos!*/
//    cout<<partida<<" "<<s3<<endl;

    int d[locais.size()];
    int p[locais.size()];
    aeroportos.Dijkstra(s3,d,p);


    /*----------------------------------------------*/
                //Validacao do Dijsktra
    /*----------------------------------------------*/
//    cout<<"p"<<endl;
//    for (int i=0;i<locais.size();i++)
//    {
//        cout<<p[i]<<" ";
//    }
//    cout<<endl;

//    cout<<"d"<<endl;
//    for (int i=0;i<locais.size();i++)
//    {
//        cout<<d[i]<<" ";
//    }
//    cout<<endl;

    /*----------------------------------------------*/
      /*obtendo os index do caminho mais curto obtido
      e salvando em um vetor organizado para impressao*/
    /*----------------------------------------------*/

    if (p[s2]==-1)
    {
        cout<<endl<<"Nao existe caminho mais curto para esse local!"<<endl<<endl;
        return 0;
    }
    //s2 é o local de chegada
    //s3 é o local de partida
    stack<int> ordem_output;
    int conti=0;
    ordem_output.push(s2);
    for (int i=s2; i!=s3; i=p[i], conti++)
    {
        ordem_output.push(p[i]);
//        cout<<"."<<ordem_output.top();
    }
//    cout<<endl;
    conti++;
    int pai_inverso[conti];
    //pai_inverso[0]=s3;
    for (int i=0;i<conti;i++)
    {
        pai_inverso[i]=ordem_output.top();
        ordem_output.pop();
    }

//    for (int i=0;i<conti;i++)
//    {
//        cout<<pai_inverso[i]<<" ";
//    }
//    cout<<endl;


    /*----------------------------------------------*/
    //impressao das saidas obtidas (caminho mais curto)
    /*----------------------------------------------*/
//    cout<<endl;
    for (int i=0;i<conti-1;i++)
    {
        if (i>0 and aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].voo ==
                    aeroportos.M[pai_inverso[i-1]][pai_inverso[i]].voo)//compara com o anterior
        {
            //cout<<endl;
        }
        else
        {
            cout<<endl;
            cout<<aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].voo;
            cout<<" "<<locais[pai_inverso[i]];
        }
        cout<<" "<<aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].partida[0];
        cout<<":"<<aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].partida[1];
        cout<<" "<<locais[pai_inverso[i+1]];
        cout<<" "<<aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].chegada[0];
        cout<<":"<<aeroportos.M[pai_inverso[i]][pai_inverso[i+1]].chegada[1];
    }
    cout<<endl<<endl;



    /*----------------------------------------------*/
                        //rascunho
    /*----------------------------------------------*/

//    cout<<"Ue"<<endl;
        //validacao da entrada
//    for (int i=0;i<nomevoo.size();i++)
//    {
//        cout<<nomevoo[i]<<endl;
//    }
//    //Inserção no Grafo

//    string voo, partida, chegada, nome;
//    while (!entrada.eof())
//    {
//        entrada>>aux;
//        nomevoo.push_back(aux);
//    }
//    entrada.close();

    //testezap
//    string x;
//    getline(cin,x);
//    vector<string> v{explode(x,' ')};
//    //string aux;
//    for (int i=0; i<x.size();i++)
//    {
//        cout<<v[i]<<endl;
//    }

}

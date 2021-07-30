#include "nodezin.h"

nodezin::nodezin()
{
    //voo="";
    //minChegada=minPartida=minTempoViagem=INT_MAX/2;
//    partida[0]="";
//    chegada[0]="";
//    tempoViagem[0]="";
    aresta=false;
}

void nodezin::set(string voo, string partida, string chegada/*, string ap, string ac*/)
{
    aresta=true;
//    aeroportoPartida=ap;
//    aeroportoChegada=ac;

    voosBrabos* vzin = new voosBrabos();
    vzin->set(voo,partida,chegada);
    voozin.push_back(*vzin);



//    voozin.sort(compare_nocase);


    /*
    this->voo=voo;
    this->partida=explode(partida,':');
    this->chegada=explode(chegada,':');

    int h1, m1, h2, m2; //variaveis declaradas

    h1=atoi(this->partida[0].c_str());
    m1=atoi(this->partida[1].c_str());

    minPartida = mintotal(h1, m1);

    h2=atoi(this->chegada[0].c_str());
    m2=atoi(this->chegada[1].c_str());

    minChegada = mintotal(h2, m2);

    minTempoViagem = minChegada-minPartida;

    if (minTempoViagem < 0){

        minTempoViagem +=1440; //calculo
        string x=hora(minTempoViagem);
        tempoViagem=explode(x,':');
        //cout<<x<<endl; //impressão do resultado
    }
    else {
        string x=hora(minTempoViagem);
        tempoViagem=explode(x,':');
        //cout<<x<<endl; //impressão do resultado
    }*/

}

//void nodezin::remove()
//{
//    aresta=false;
//    voo="";
//    partida.clear();
//    chegada.clear();
//    tempoViagem.clear();
//    minPartida=minChegada=minTempoViagem=INT_MAX/2;
//}

void nodezin::print()
{
    for (list<voosBrabos>::iterator it=voozin.begin(); it!=voozin.end();++it)
    {
        it->print();
    }


//    cout<<voo<<" "<<partida[0]+":"+partida[1]<<" "<<chegada[0]+":"+chegada[1]
//                    <<" "<<tempoViagem[0]+":"+tempoViagem[1]<<endl;
//    cout<<minPartida<<" "<<minChegada<<" "<<minTempoViagem<<endl;
}

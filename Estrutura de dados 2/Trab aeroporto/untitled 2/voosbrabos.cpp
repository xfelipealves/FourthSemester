#include "voosbrabos.h"

void voosBrabos::set(string voo, string partida, string chegada)
{
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
    }
}

voosBrabos::voosBrabos()
{
//    voo="";
//    minChegada=minPartida=minTempoViagem=INT_MAX/2;
}

void voosBrabos::print()
{
    cout<<voo<<" "<<partida[0]+":"+partida[1]<<" "<<chegada[0]+":"+chegada[1]
                    <<" "<<tempoViagem[0]+":"+tempoViagem[1]<<endl;
    cout<<minPartida<<" "<<minChegada<<" "<<minTempoViagem<<endl;
}

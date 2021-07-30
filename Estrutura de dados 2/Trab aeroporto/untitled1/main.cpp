//#include <iostream>
//#include <vector>
//using namespace std;



//int main()
//{
//    string x,y,z;
//    cin>>x>>y;
//    vector<string> x1{explode(x,':')};
//    vector<string> y1{explode(y,':')};
//    vector<string> z1{explode(y,':')};
//    int t1,t2,t3,t4;

//    t1=atoi(x1[0].c_str());
//    t2=atoi(x1[1].c_str());
//    t3=atoi(y1[0].c_str());
//    t4=atoi(y1[1].c_str());

//    if ()

//    cout<<x<<endl;
//    cout<<y<<endl;
//}

#include <stdio.h>
#include <iostream>
#include <vector>
#include <string>
using namespace std;

const vector<string> explode(const string& s, const char& c)
{
    string buff{""};
    vector<string> v;

    for(auto n:s)
    {
        if(n != c) buff+=n; else
        if(n == c && buff != "") { v.push_back(buff); buff = ""; }
    }
    if(buff != "") v.push_back(buff);

    return v;
}

int mintotal(int hora, int minuto) {

    int r = (hora*60) + minuto;

    return r;
}

std::string hora(int minutos) {

    int hora=0;
    string retorno;
    while (minutos>=60)
    {
        hora++;
        minutos-=60;
    }
    if (hora<10)
    {
        retorno="0";
    }
    retorno+=to_string(hora);
    retorno+=":";
    if (minutos<10)
    {
        retorno+="0";
    }
    retorno+=to_string(minutos);
    return retorno;
}

int main (){

    string x,y,z;
    cin>>x>>y;
    vector<string> x1;

    x1=explode(x,':');
    vector<string> y1{explode(y,':')};
    vector<string> z1{explode(y,':')};

    int h1, m1, h2, m2, r1, r2, total; //variaveis declaradas

    h1=atoi(x1[0].c_str());
    m1=atoi(x1[1].c_str());

    r1 = mintotal(h1, m1);

    h2=atoi(y1[0].c_str());
    m2=atoi(y1[1].c_str());

    r2 = mintotal(h2, m2);

    total = r2-r1;

    if (total < 0){

        total +=1440; //calculo
        string x=hora(total);
        cout<<x<<endl;
    } //impressão do resultado
    else {
        string x=hora(total);
        cout<<x<<endl;//impressão do resultado
    }
    return 0;

}

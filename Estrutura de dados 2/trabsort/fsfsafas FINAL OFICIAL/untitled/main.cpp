#include <iostream>
#include "sort.h"
#include <chrono>

using namespace std;

bool validaSort(int* v, int n)
{
    for (int i = 1; i < n; i++)
    {
        if (v[i] < v[i - 1])
            return false;
    }
    return true;
}

string VerificaOrd(int *v, int n)
{
    for (int i=0; i<n; i++)
    {
        if (v[i]!=1)
            return "ERRO";
    }
    return "OK";
}

int main()
{
    int ordC[34],ordD[34],ordR[34];
    double c[6][7],d[6][7],r[6][7];
    int l=0,b=0;
    for(int i = 100; i <= 100000;  i = i * 10, l++, b++)    //INSERTION
    {//Todos os vetores de 100 a 100 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "InsertionSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::InsertionSort(v1,i);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;
        ordC[l]=validaSort(v1,i);


        auto inicio2 = chrono::system_clock::now();
        sort::InsertionSort(v2, i);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;
        ordD[l]=validaSort(v2,i);

        auto inicio3 = chrono::system_clock::now();
        sort::InsertionSort(v3, i);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;
        ordR[l]=validaSort(v3,i);

        c[b%6][0]=tempo1.count();
        d[b%6][0]=tempo2.count();
        r[b%6][0]=tempo3.count();
        cout << endl;
    }
    b=b+2;
    cout<<endl<<"================================================"<<endl;

    for(int i = 100; i <= 100000;  i = i * 10, l++, b++)    //SELECTION
    {//Todos os vetores de 100 a 100 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "SelectionSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::SelectionSort(v1,i);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;
        ordC[l]=validaSort(v1,i);

        auto inicio2 = chrono::system_clock::now();
        sort::SelectionSort(v2, i);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;
        ordD[l]=validaSort(v2,i);

        auto inicio3 = chrono::system_clock::now();
        sort::SelectionSort(v3, i);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;
        ordR[l]=validaSort(v3,i);

        c[b%6][1]=tempo1.count();
        d[b%6][1]=tempo2.count();
        r[b%6][1]=tempo3.count();

        cout << endl;
    }
    b=b+2;
    cout<<endl<<"================================================"<<endl;

    for(int i = 100; i <= 100000;  i = i * 10, l++, b++)    //BUBBLE
    {//Todos os vetores de 100 a 100 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "BubbleSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::BubbleSort(v1,i);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;
        ordC[l]=validaSort(v1,i);

        auto inicio2 = chrono::system_clock::now();
        sort::BubbleSort(v2, i);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;
        ordD[l]=validaSort(v2,i);

        auto inicio3 = chrono::system_clock::now();
        sort::BubbleSort(v3, i);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;
        ordR[l]=validaSort(v3,i);

        c[b%6][2]=tempo1.count();
        d[b%6][2]=tempo2.count();
        r[b%6][2]=tempo3.count();

        cout << endl;
    }
    b=b+2;
    cout<<endl<<"================================================"<<endl;

    for(int i = 100; i <= 100000;  i = i * 10, l++, b++)    //QUICK
    {//Todos os vetores de 100 a 100 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "QuickSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::QuickSort(v1, 0, i - 1);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;

        auto inicio2 = chrono::system_clock::now();
        sort::QuickSort(v2, 0, i - 1);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;

        auto inicio3 = chrono::system_clock::now();
        sort::QuickSort(v3, 0, i - 1);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;

        ordC[l]=validaSort(v1,i);
        ordD[l]=validaSort(v2,i);
        ordR[l]=validaSort(v3,i);

        c[b%6][3]=tempo1.count();
        d[b%6][3]=tempo2.count();
        r[b%6][3]=tempo3.count();
        cout << endl;
    }
    b=b+2;
    cout<<endl<<"================================================"<<endl;

    for(int i = 100; i <= 10000000;  i = i * 10, l++, b++)    //MERGE
    {//Todos os vetores de 100 a 10 000 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "MergeSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::MergeSort(v1, 0, i - 1);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;


        auto inicio2 = chrono::system_clock::now();
        sort::MergeSort(v2, 0, i - 1);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;


        auto inicio3 = chrono::system_clock::now();
        sort::MergeSort(v3, 0, i - 1);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;
        ordC[l]=validaSort(v1,i);
        ordD[l]=validaSort(v2,i);
        ordR[l]=validaSort(v3,i);

        c[b%6][4]=tempo1.count();
        d[b%6][4]=tempo2.count();
        r[b%6][4]=tempo3.count();

        cout << endl;
    }

    cout<<endl<<"================================================"<<endl;


    for(int i = 100; i <= 10000000;  i = i * 10, l++, b++)    //HEAP
    {//Todos os vetores de 100 a 10 000 000
        int* v1 = new int[i+1];//vet crescente
        int* v2 = new int[i+1];//vet descrescente
        int* v3 = new int[i+1];//vet random
        for (int j = 1, k= i; j <= i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "HeapSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::HeapSort(v1, i);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;

        auto inicio2 = chrono::system_clock::now();
        sort::HeapSort(v2, i);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;

        auto inicio3 = chrono::system_clock::now();
        sort::HeapSort(v3, i);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;

        ordC[l]=validaSort(v1,i);
        ordD[l]=validaSort(v2,i);
        ordR[l]=validaSort(v3,i);

        c[b%6][5]=tempo1.count();
        d[b%6][5]=tempo2.count();
        r[b%6][5]=tempo3.count();

        cout << endl;
    }

    cout<<endl<<"================================================"<<endl;

    for(int i = 100; i <= 10000000;  i = i * 10, l++, b++)    //RADIX
    {//Todos os vetores de 100 a 10 000 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (int j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "RadixSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::Radix_Sort(v1, i);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F s\n", tempo1.count());
//        cout << "Ordenado: " << validaSort(v1, i) << endl;

        auto inicio2 = chrono::system_clock::now();
        sort::Radix_Sort(v2, i);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F s\n", tempo2.count());
//        cout << "Ordenado: " << validaSort(v2, i) << endl;

        auto inicio3 = chrono::system_clock::now();
        sort::Radix_Sort(v3, i);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F s\n", tempo3.count());
//        cout << "Ordenado: " << validaSort(v3, i) << endl;

        ordC[l]=validaSort(v1,i);
        ordD[l]=validaSort(v2,i);
        ordR[l]=validaSort(v3,i);

        c[b%6][6]=tempo1.count();
        d[b%6][6]=tempo2.count();
        r[b%6][6]=tempo3.count();

        cout << endl;
    }





    cout<<endl<<"================================================"<<endl;

//    for (int i=0, k=100; i<6; i++, k*=10)
//    {
//        cout<<k<<" ";
//        for (int j=0; j<7; j++)
//        {
//            cout<<c[i][j]<<"/"<<d[i][j]<<"/"<<r[i][j]<<"/"<<"pp";
//        }
//        cout<<endl;
//    }

//    cout<<endl<<endl;

//    for (int i=4; i<6; i++)
//    {
//        for (int j=0; j<3; j++)
//        {

//        }
//    }



    cout<<"Ordenacao dos Vetores Crescente: "<<VerificaOrd(ordC,l)<<endl;
    cout<<"Ordenacao dos Vetores Derescente: "<<VerificaOrd(ordD,l)<<endl;
    cout<<"Ordenacao dos Vetores Random: "<<VerificaOrd(ordR,l)<<endl;

    cout<<endl<<"=================VETOR CRESCENTE================"<<endl;
    cout<<"Tamanho   /Insertion / Selection/  Bubble  /   Quick  /   Merge  /   Heap   /   Radix"<<endl;
    for (int i = 100, k=0; i <= 10000000;  i = i * 10, k++)
    {
        cout<<i;
        for (int i=6;i>k;i--)
            cout<<" ";
        cout<<" / ";
        for (int j=0;j<7;j++)
        {
            if (k>3 && j<4)
            {
                cout<<"    -    / ";
            }
            else
            {
                printf("%F / ", c[k][j]);
            }
        }
        cout<<endl;
    }

    cout<<endl<<"================VETOR DECRESCENTE==============="<<endl;
    cout<<"Tamanho   /Insertion / Selection/  Bubble  /   Quick  /   Merge  /   Heap   /   Radix"<<endl;
    for (int i = 100, k=0; i <= 10000000;  i = i * 10, k++)
    {
        cout<<i;
        for (int i=6;i>k;i--)
            cout<<" ";
        cout<<" / ";
        for (int j=0;j<7;j++)
        {
            if (k>3 && j<4)
            {
                cout<<"    -    / ";
            }
            else
            {
                printf("%F / ", d[k][j]);
            }
        }
        cout<<endl;
    }

    cout<<endl<<"==================VETOR RANDOM=================="<<endl;
    cout<<"Tamanho   /Insertion / Selection/  Bubble  /   Quick  /   Merge  /   Heap   /   Radix"<<endl;
    for (int i = 100, k=0; i <= 10000000;  i = i * 10, k++)
    {
        cout<<i;
        for (int i=6;i>k;i--)
            cout<<" ";
        cout<<" / ";
        for (int j=0;j<7;j++)
        {
            if (k>3 && j<4)
            {
                cout<<"    -    / ";
            }
            else
            {
                printf("%F / ", r[k][j]);
            }
        }
        cout<<endl;
    }

    //int t = 10000000;
    //int* v = new int[t];
    //for (int i = 0; i < t; i++)
    //{
    //    v[i] = rand() % 10000;
    //}

    //cout << "Antes: ";
    //for (int i = 0; i < t; i++)
    //{
    //    cout << v[i] << " ";
    //}
    //cout << endl;

    //auto inicio = chrono::system_clock::now();
    //sort::MergeSort(v, 0,t-1);
    //auto fim = chrono::system_clock::now();
    //chrono::duration<double> tempo = fim - inicio;
    //printf("Tempo: %F \n", tempo.count(), "s");

    //cout << "Depois: ";
    //for (int i = 0; i < t; i++)
    //{
    //    cout << v[i] << " ";
    //}
    //cout << endl;
    
    
    
    return 0;
}

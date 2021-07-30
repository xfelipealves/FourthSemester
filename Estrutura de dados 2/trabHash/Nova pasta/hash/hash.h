#ifndef HASH_H
#define HASH_H


class Hash
{
private:
    list<thing>* Vet;
    int MAX;
    int a, b, p;
public:
    Hash(int Max);
    ~Hash();
    void insert(char* k, int D);
    bool remove(char* k);
    bool search(char* k, thing* OBJ);
    int hash(char* k);
};

#endif // HASH_H

#include <iostream>
#Include <string>

using namespace std;
     
class Matrix {
public:
    explicit Matrix(int a = 2, int b = 2);
    Matrix(Matrix&);
    Matrix(int*, int, int);
    ~Matrix() { delete [] pa; };
    void init(int *, int, int);
    void dump();
     
private:
    int *pa;
    int a, b;
};
     
void 
Matrix::
init(int *array, int aa, int bb)
{
    int size = aa * bb;
    pa = new int[size];
    a  = aa;
    b  = bb;
    for (int i = 0; i < size; i++)
    {
        if (!array)
            pa[i] = 0;
        else
            pa[i] = array[i];
    }
}
     
Matrix::
Matrix(int a, int b)
{
    cout << "Matrix" << endl;
    init(0, a, b);
}
     
Matrix::
Matrix(int *pa, int a, int b)
{
    init(pa, a, b);
}
     
Matrix::
Matrix(Matrix& m)
{
    init(m.pa, m.a, m.b);
}

void
Matrix::
dump()
{
    int i,j;

    cout << "in dump" << endl;
    for (i = 0; i < a; i++)
    {
        for (j = 0; j < b; j++)
            cout << pa[j + i * b] << " " ;
        cout << endl;
    }
    return;
}
     
int main()
{
    Matrix m(3, 4);

    cout << "main" << endl;
    m.dump();
}

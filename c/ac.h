class Demo
{
public:
    Demo(int);
    Demo(int, int);
    Demo(int, int , int);
    ~Demo();

    int a(int);
    int a(double);
    int a(char);
    int b(int);
    int c();
private:
    int a,b,c;
};

// Kamoliddin Saloxutdinov 230378
// Friday 9:00

#include <iostream>
#include <string>
#include <algorithm>
#include <stdexcept>
#include <future>
#include <vector>
#include <memory>
using namespace std;

int main(int argc, char* argv[]) {
    // Main Function
    // Q1
    cout << "Number of arguments received: " << argc << endl;
    cout << "Arguments are:" << endl;
    for (int i = 0; i < argc; i++) {
        cout << "Argument " << i << ": " << argv[i] << endl;
    }

    // Q2
    cout << "Answer: The primary purpose of main is program entry. In Java it is static so it can run without object." << endl;

    // Q3
    cout << "Answer: In C++ main returns int with (int argc, char* argv[]). In Java main is public static void main(String[] args)." << endl;

    // Q4
    cout << "Answer: The return value indicates exit status (0 = success). In Java non-zero exit can be done with System.exit(code)." << endl;

    // Variables
    // Q1
    int a = 10, b = 20;
    cout << "Before swap: a=" << a << ", b=" << b << endl;
    a = a + b;
    b = a - b;
    a = a - b;
    cout << "After swap: a=" << a << ", b=" << b << endl;

    // Q2
    cout << "Answer: Primitive types store values directly, reference types store memory addresses." << endl;

    // Q3
    cout << "Answer: Scope defines where a variable is visible. Local = inside function, Class-level = fields or static members." << endl;

    // Q4
    cout << "Answer: Statically-typed means type is checked at compile-time (C++/Java). Dynamic typing resolves at runtime." << endl;

    // Control Flow
    // Q1
    int n1 = 0, n2 = 1, nextTerm;
    cout << "Fibonacci: ";
    for (int i = 1; i <= 10; i++) {
        if (i == 1) { cout << n1 << " "; continue; }
        if (i == 2) { cout << n2 << " "; continue; }
        nextTerm = n1 + n2;
        n1 = n2;
        n2 = nextTerm;
        cout << nextTerm << " ";
    }
    cout << endl;

    // Q2
    cout << "Answer: while checks before loop, do-while checks after. do-while runs at least once." << endl;

    // Q3
    cout << "Answer: switch selects among cases. case = branch, break = exit, default = fallback." << endl;

    // Q4
    cout << "Answer: Short-circuit means && stops if false, || stops if true. Useful to avoid null checks." << endl;

    // Functions / Methods
    // Q1
    auto isPalindrome = [](string str) {
        return equal(str.begin(), str.begin()+str.size()/2, str.rbegin());
    };
    cout << "madam palindrome? " << (isPalindrome("madam") ? "true" : "false") << endl;

    // Q2
    cout << "Answer: C++ passes by value, pointer, or reference. Java passes primitives by value, objects as reference by value." << endl;

    // Q3
    cout << "Answer: Overloading needs different parameter lists. Return type alone is not enough." << endl;

    // Q4
    cout << "Answer: Recursion calls itself. Base case prevents infinite recursion." << endl;

    // Comments
    // Q1
    // single-line
    /* multi-line */
    /** documentation-style */
    cout << "Comments provide context." << endl;

    // Q2
    cout << "Answer: Comments improve maintainability and teamwork." << endl;

    // Q3
    cout << "Answer: Javadoc/Doxygen generate docs for code understanding." << endl;

    // Q4
    cout << "Answer: Good code is self-documenting but comments clarify intent or complex logic." << endl;

    // Classes
    // Q1
    class BankAccount {
        double balance;
    public:
        BankAccount(double initial) { balance = (initial >= 0) ? initial : 0; }
        void deposit(double amt) { if (amt > 0) balance += amt; }
        double getBalance() { return balance; }
    };
    BankAccount acc(100);
    acc.deposit(50);
    cout << "Balance: " << acc.getBalance() << endl;

    // Q2
    cout << "Answer: Class = blueprint, Object = instance of class." << endl;

    // Q3
    cout << "Answer: public = accessible, private = internal, protected = subclass access." << endl;

    // Q4
    cout << "Answer: Constructor initializes object. Default constructor is provided if no custom one exists." << endl;

    // Enums
    // Q1
    enum class Season { SPRING, SUMMER, AUTUMN, WINTER };
    auto recommendActivity = [](Season s) {
        switch(s) {
            case Season::SPRING: return "Plant flowers";
            case Season::SUMMER: return "Go to the beach";
            case Season::AUTUMN: return "Rake leaves";
            case Season::WINTER: return "Build a snowman";
        }
        return "Rest";
    };
    cout << recommendActivity(Season::SUMMER) << endl;

    // Q2
    cout << "Answer: Enums replace magic numbers, increase readability." << endl;

    // Q3
    cout << "Answer: Enums give type safety and better self-documentation." << endl;

    // Q4
    cout << "Answer: Java enums can have methods/fields, C++ enums are simpler unless scoped." << endl;

    // Inheritance
    // Q1
    class Vehicle {
    public: void startEngine() { cout << "Engine started" << endl; }};
    class Car: public Vehicle {
    public: void drive() { cout << "Car driving" << endl; }};
    Car myCar; myCar.startEngine(); myCar.drive();

    // Q2
    cout << "Answer: is-a = inheritance, has-a = composition." << endl;

    // Q3
    cout << "Answer: Overriding = redefine method in subclass. Keywords: virtual/override in C++, @Override in Java." << endl;

    // Q4
    cout << "Answer: Diamond Problem solved by virtual inheritance in C++, avoided in Java with interfaces." << endl;

    // Mixins / Interfaces
    // Q1
    class IStringable { public: virtual string toString() const = 0; };
    class Book: public IStringable {
        string title; string author;
    public:
        Book(string t, string a): title(t), author(a) {}
        string toString() const override { return "'" + title + "' by " + author; }
    };
    class Printable {
    public: void print(const IStringable& obj){ cout << obj.toString() << endl; }};
    Book book("The Hobbit","Tolkien"); Printable p; p.print(book);

    // Q2
    cout << "Answer: Mixins/interfaces add reusable functionality without strict hierarchy." << endl;

    // Q3
    cout << "Answer: Java default methods provide mixin-like reuse." << endl;

    // Q4
    cout << "Answer: Trade-offs: inheritance shares structure, composition is flexible, mixins add behavior." << endl;

    // Polymorphism
    // Q1
    class Shape { public: virtual double getArea() const = 0; virtual ~Shape()=default; };
    class Rectangle: public Shape { double w,h; public: Rectangle(double w,double h):w(w),h(h){} double getArea() const override { return w*h; }};
    class Circle: public Shape { double r; public: Circle(double r):r(r){} double getArea() const override { return 3.14159*r*r; }};
    vector<unique_ptr<Shape>> shapes; shapes.push_back(make_unique<Rectangle>(10,5)); shapes.push_back(make_unique<Circle>(3));
    for (auto& s: shapes) cout << "Area: " << s->getArea() << endl;

    // Q2
    cout << "Answer: Compile-time polymorphism = overloading. Runtime polymorphism = overriding with virtual functions." << endl;

    // Q3
    cout << "Answer: Abstract class has abstract + concrete methods. Interface (Java) = all abstract. Use interface for contracts." << endl;

    // Q4
    cout << "Answer: Both interfaces and abstract classes allow polymorphism via base references." << endl;

    // Async Operations
    // Q1
    auto calculateSum = [](){ long long sum=0; for(long long i=1;i<=1000000;i++) sum+=i; return sum; };
    future<long long> sumFuture = async(launch::async, calculateSum);
    cout << "Calculating..." << endl;
    cout << "Sum result: " << sumFuture.get() << endl;

    // Q2
    cout << "Answer: Async solves blocking I/O problem." << endl;

    // Q3
    cout << "Answer: Parallel = tasks truly at same time, Concurrent = tasks interleave." << endl;

    // Q4
    cout << "Answer: Future/Promise represent result of async tasks." << endl;

    // Exceptions
    // Q1
    auto processAge = [](int age){ if(age<0) throw invalid_argument("Age cannot be negative."); cout << "Age ok: " << age << endl; };
    try { processAge(-5); }
    catch(const invalid_argument& e){ cerr << "Error: " << e.what() << endl; }

    // Q2
    cout << "Answer: try runs code, catch handles, finally ensures cleanup. C++ uses RAII instead of finally." << endl;

    // Q3
    cout << "Answer: Java has checked/unchecked exceptions. C++ does not distinguish." << endl;

    // Q4
    cout << "Answer: Exceptions improve readability but may affect performance." << endl;

    return 0;
}

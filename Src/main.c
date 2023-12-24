void main () {
    *(char*)0xb8000 = 'Q';
    while(1);
    return;
}
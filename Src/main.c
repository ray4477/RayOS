int strlen(const char* str) 
{
	int len = 0;
	while (str[len])
		len++;
	return len;
}

void printLine(const char * str) {
    char* terminal_buffer = (char*) 0xB8000;
    for (int i = 0; i < strlen(str);i++) {
        *(terminal_buffer+2*i) = *(str + i);
    }
}

void main() {
    printLine("Hello World!");
    while(1);
    return;
}
CFLAGS=-std=c11 -g -fno-common
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

chibicc: $(OBJS)
				$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJS): chibicc.h

test: chibicc
			chmod +x test.sh;	./test.sh
			chmod +x test-driver.sh; ./test-driver.sh

clean:
				rm -f chibicc *.o *~ tmp*

.PHONY: test clean
#
# Copyright (c) 2016 Cossack Labs Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CFLAGS = -I. -Wall -g -fPIC -Og -std=gnu99  
LIBS += -lthemis

all: rd_themis.so

rd_themis.o: src/rd_themis.c
	$(CC) $(CFLAGS) -c -o $@ src/rd_themis.c

rd_themis.so: rd_themis.o 
	$(LD) -o $@ rd_themis.o -shared $(LIBS) -lc 

clean:
	rm -rf *.so *.o

test: all
	./test.sh
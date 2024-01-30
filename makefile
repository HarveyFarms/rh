# for c++ programs
c:
	g++ *.cpp
r:
	./a.out

# for sdl programs specifically
sdl:
	g++ main.cpp -lSDL2

# for github ... 
git:
	git add -A ; git commit -m "sync" ; git push
p:
	git pull


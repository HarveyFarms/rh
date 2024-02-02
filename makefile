c:
	g++ *.cpp
r:
	./a.out

# for sdl programs specifically
sdl:
	g++ main.cpp -lSDL2

# for github ... 
p:
	git pull
git:
	git add -A ; git commit -m "sync" ; git push

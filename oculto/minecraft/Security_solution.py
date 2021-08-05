import sys

def main():
    cadena = sys.argv[1]
    if cadena.find("$GT")!=-1 or cadena.find("TG$")!=-1:
        print("quiet")
        return
    print("ALARM")

if __name__ == "__main__":
    main()
# Integrating and differentiating

This console application can evaluate differential and integral of the function. Also it can build plot

## Requirements

- [gnuplot](http://www.gnuplot.info/) (Optional. You can install it if you need plot output)

For macOS `gnulpot` installation via homebrew:

```sh
$ brew install gnuplot
# Installs gnuplot
```

## Usage

```
Usage: lab5-exe [--version] [--help] [-v|--verbose] [-i|--integrate]
                [-g|--graphic FILEPATH.eps] -x NUMBER -y NUMBER
                (-s|--step NUMBER) --xf NUMBER
```

### Example

```sh
$ ./integration-exe --help
# Outputs help message

$ ./integration-exe -x -2 -y -2 -s 0.0001 --xf 2 -g ./plot1.eps -i
# Saves plot to ./plot1.eps if gnuplot is installed
```

### Avalilable options

| Long                     | Short | Required | Description                                             |
|--------------------------|-------|----------|---------------------------------------------------------|
| ---version               | none  | -        | Show version                                            |
| --help                   | none  | -        | Show help text                                          |
| --verbose                | -v    | -        | Verbose output?                                         |
| --integrate              | -i    | -        | If specified evaluates integral. Otherwise differential |
| --graphic `FILEPATH.eps` | -g    | -        | Path to output graphic. Requires gnuplot                |
| none                     | -x    | +        | Initial x value                                         |
| none                     | -y    | +        | Initial y value                                         |
| --step                   | -s    | +        | Step value                                              |
| --xf                     | none  | +        | Build graphic while x ≤ xf                              |

## Build from source

1. Install [Haskell Stack](haskellstack.org/) and GHC or [Haskell Platform](https://www.haskell.org/platform/)

2. Clone this repository

```sh
$ git clone https://github.com/alienvspredator/integration.git
# Cloning into 'integration'...
```

3. Go to cloned repository directory

```sh
$ cd integration
# Goes to cloned directory
```

4. Run following command

```sh
$ stack build
# Builds the utility
```

5. Builded binary will output into `./.stack-work/dist/*target-arch*/Cabal-*version*/build/integrator-exe`

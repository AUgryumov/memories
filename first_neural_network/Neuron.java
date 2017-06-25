class Neuron {
    private byte[][] mem = new byte[16][16];
    Neuron(byte[][] mem) {
        this.mem = mem;
    }

    int check(byte[][] in) {
        int out = 0;

        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                if (mem[i][j] > 0 && in[i][j] == 0) { out += mem[i][j]; }
            }
        }
        return out;
    }
}

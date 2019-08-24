void xtea(long int word0, long int word1, long int key0,
          long int key1, long int key2, long int key3,
          bool mode,
          long int *result0, long int *result1)
{

    long int sum;
    long int i, delta, v0, v1, temp;
    v0 = word0;
    v1 = word1;
    sum = 0;
    *result0 = 0;
    *result1 = 0;

    if (mode == 0)
    {
        // encipher
        delta = 0x9e3779b9;
        for (i = 0; i < 32; i++)
        {
            if ((sum & 3) == 0)
                temp = key0;
            else if ((sum & 3) == 1)
                temp = key1;
            else if ((sum & 3) == 2)
                temp = key2;
            else
                temp = key3;

            v0 += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + temp);

            sum += delta;

            if (((sum >> 11) & 3) == 0)
                temp = key0;
            else if (((sum >> 11) & 3) == 1)
                temp = key1;
            else if (((sum >> 11) & 3) == 2)
                temp = key2;
            else
                temp = key3;

            v1 += (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + temp);
        }
    }

    else if (mode == 1)
    {
        // decipher
        delta = 0x9e3779b9;
        sum = delta * 32;
        for (i = 0; i < 32; i++)
        {

            if (((sum >> 11) & 3) == 0)
                temp = key0;
            else if (((sum >> 11) & 3) == 1)
                temp = key1;
            else if (((sum >> 11) & 3) == 2)
                temp = key2;
            else
                temp = key3;

            v1 -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + temp);

            sum -= delta;

            if ((sum & 3) == 0)
                temp = key0;
            else if ((sum & 3) == 1)
                temp = key1;
            else if ((sum & 3) == 2)
                temp = key2;
            else
                temp = key3;

            v0 -= (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + temp);
        }
    }
    *result0 = v0;
    *result1 = v1;
}

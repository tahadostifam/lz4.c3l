import std::io;
import libc;
import lz4;

fn int main(String[] args)
{	    
	ZString input = "This is a test string to compress using LZ4!";
    int inputSize = (int) libc::strlen(input) + 1; 
	
	io::printfn("input string: %s", input);

    int maxCompressedSize = lz4::compress_bound(inputSize); 
    char* compressedData = (char*) malloc(maxCompressedSize);
    if (compressedData == null)
    {
        io::printn("Memory allocation failed!");
        return 1;
    }

	io::printfn("maxCompressedSize: %d", maxCompressedSize);

    int compressedSize = lz4::compress_default(input, compressedData, inputSize, maxCompressedSize);
    if (compressedSize <= 0)
    {	
		io::printn("Compression failed!");
        free(compressedData);
        return 1;
    }

	io::printfn("Compressed data size: %d", compressedSize);
    io::printf("Compressed data: ");
    for (int i = 0; i < compressedSize; i++)
    {
        io::printf("%02x", (char) compressedData[i]);
    }

	io::printn();

	return 0;
}

import std::io;
import lz4;

fn int main(String[] args)
{
	io::printfn("version: %s", lz4::version_string());

	return 0;
}

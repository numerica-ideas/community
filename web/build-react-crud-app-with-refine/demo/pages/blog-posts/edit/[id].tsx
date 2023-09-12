import { GetServerSideProps } from "next";
import { serverSideTranslations } from "next-i18next/serverSideTranslations";

import { getServerSession } from "next-auth";
import { authOptions } from "../../api/auth/[...nextauth]";
import { Create, Edit } from "@refinedev/mui";
import { useForm } from "@refinedev/core";
import { Box, Button, TextField } from "@mui/material";
import { useEffect, useState } from "react";


interface FormValues {
  id?: number;
  title: string;
  content: string;
}

export default function BlogPostEdit() {
  const { formLoading, onFinish, queryResult } = useForm();
  const defaultValues = queryResult?.data?.data;

  const [values, setValues] = useState<FormValues>({
    title: defaultValues?.title || "",
    content: defaultValues?.content || "",
  })

  useEffect(() => {
    if (defaultValues) {
      setValues({
        title: defaultValues?.title,
        content: defaultValues?.content
      })
    }
  }, [defaultValues])

  const onChangeValue = (e: any) => {
    setValues({
      ...values,
      [e.target.name]: e.target.value,
    });
  }
  const handleSubmit = (e: any) => {
    e.preventDefault();
    onFinish(values);
  };
  return <Edit isLoading={formLoading} footerButtons={<Button variant="outlined" disabled={formLoading} onClick={handleSubmit}>Save</Button>}>
    <Box
      component="form"
      noValidate
      autoComplete="off"
    >

      <TextField
        label="Title"
        name="title"
        required
        variant="outlined"
        color="primary"
        disabled={formLoading}
        type="text"
        sx={{ mb: 3 }}
        fullWidth
        onChange={onChangeValue}
        value={values.title}
      />
      <TextField
        label="Content"
        name="content"
        variant="outlined"
        color="primary"
        type="content"
        disabled={formLoading}
        fullWidth
        sx={{ mb: 3 }}
        onChange={onChangeValue}
        value={values.content}
      />
    </Box>
  </Edit>
}

export const getServerSideProps: GetServerSideProps<{}> = async (context) => {
  const session = await getServerSession(context.req, context.res, authOptions);

  const translateProps = await serverSideTranslations(context.locale ?? "en", [
    "common",
  ]);

  if (!session) {
    return {
      props: {
        ...translateProps,
      },
      redirect: {
        destination: `/login?to=${encodeURIComponent("/blog-posts")}`,
        permanent: false,
      },
    };
  }

  return {
    props: {
      ...translateProps,
    },
  };
};
